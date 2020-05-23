# frozen_string_literal: true

require_relative 'display.rb'

# Board Logic for Connect Four
class Board
  include Display
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
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
    board.all? do |row|
      row.all? { |spot| spot.match?(/^[12]$/) }
    end
  end

  def row_victory?
    board.each do |row|
      4.times { |n| return true if connect_four?(row[n..n + 3]) }
    end
    false
  end

  # # Need Test
  # def column_victory?; end

  # # Need Test
  # def diagonal_victory?; end

  private

  def find_empty_spot(column)
    row_index = []
    board.each_with_index do |row, index|
      row_index << index if row[column].empty?
    end
    row_index[-1]
  end

  def connect_four?(array)
    array.uniq.size == 1 && array[0] != ''
  end
end
