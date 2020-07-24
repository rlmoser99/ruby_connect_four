# frozen_string_literal: true

require_relative 'display.rb'

# Board Logic for Connect Four
class GameBoard
  include Display
  attr_reader :board
  FORWARD_COORDINATES = [
    [0, 0], [0, 1], [0, 2], [0, 3],
    [1, 0], [1, 1], [1, 2], [1, 3],
    [2, 0], [2, 1], [2, 2], [2, 3]
  ].freeze
  BACKWARD_COORDINATES = [
    [0, 3], [0, 4], [0, 5], [0, 6],
    [1, 3], [1, 4], [1, 5], [1, 6],
    [2, 3], [2, 4], [2, 5], [2, 6]
  ].freeze

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
    @detect = Detector.new
  end

  def valid_move?(column)
    board.any? { |row| row[column].empty? }
  end

  def update(column, player, count = Hash.new(0))
    user_column = board.transpose[column]
    user_column.each { |cell| count[cell] += 1 }
    board[count[''] - 1][column] = player.number.to_s
    board
  end

  def full?
    board.flatten.reject(&:empty?).size == 42
  end

  def row_victory?
    board.any? do |row|
      @detect.connect_four?(row)
    end
  end

  def column_victory?
    board.transpose.any? do |row|
      @detect.connect_four?(row)
    end
  end

  def diagonal_victory?
    diagonal_check?(FORWARD_COORDINATES, 'forward') ||
      diagonal_check?(BACKWARD_COORDINATES, 'backward')
  end

  def complete?
    full? || row_victory? || column_victory? || diagonal_victory?
  end

  protected

  def diagonal_check?(coordinates, direction)
    coordinates.each do |coords|
      complete_diagonal = build_diagonal(coords[0], coords[1], direction)
      return true if @detect.connect_four?(complete_diagonal)
    end
    false
  end

  def build_diagonal(row, column, direction, array = [])
    array << board[row][column]
    return array if array.length == 4

    column += 1 if direction == 'forward'
    column -= 1 if direction == 'backward'
    build_diagonal(row + 1, column, direction, array)
  end
end
