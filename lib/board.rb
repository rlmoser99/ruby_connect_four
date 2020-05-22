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

  # # Need Test
  # def full?; end

  # # Need Test
  # def row_victory?; end

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
end
