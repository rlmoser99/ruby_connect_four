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

  def update(column, player)
    row = find_empty_spot(column)
    board[row][column] = player.number.to_s
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
    forward_diagonal? || backward_diagonal?
  end

  def complete?
    full? || row_victory? || column_victory? || diagonal_victory?
  end

  protected

  def find_empty_spot(column)
    row_index = []
    board.each_with_index do |row, index|
      row_index << index if row[column].empty?
    end
    row_index[-1]
  end

  # COMBINE THESE TWO INTO ONE METHOD???
  def forward_diagonal?
    FORWARD_COORDINATES.each do |coords|
      forward_array = diagonal_array(coords[0], coords[1], 'forward')
      return true if @detect.connect_four?(forward_array)
    end
    false
  end

  def backward_diagonal?
    BACKWARD_COORDINATES.each do |coords|
      backward_array = diagonal_array(coords[0], coords[1], 'backward')
      return true if @detect.connect_four?(backward_array)
    end
    false
  end

  def diagonal_array(row, column, direction, array = [])
    array << board[row][column]
    return array if array.length == 4

    column += 1 if direction == 'forward'
    column -= 1 if direction == 'backward'
    diagonal_array(row + 1, column, direction, array)
  end
end
