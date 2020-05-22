# frozen_string_literal: true

require_relative 'display.rb'

class Board
  include Display
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  # # Need Test
  # def valid_move?; end

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
