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

  # # Need Test
  # def update; end

  # # Need Test
  # def full?; end

  # # Need Test
  # def row_victory?; end

  # # Need Test
  # def column_victory?; end

  # # Need Test
  # def diagonal_victory?; end
end
