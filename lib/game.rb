# frozen_string_literal: true

require './display'

class Game
  include Display
  attr_accessor :board

  def initialize
    @board = Board.new
    play_game
  end

  def play_game
    puts display_welcome
    player1 = create_player(1)
    player2 = create_player(2)
    # board.display_board
    # turn_order
  end

  def create_player(number)
    puts display_name(number)
    name = gets.chomp
    Player.new(name, number)
  end

  # def turn_order
  #   until winner? || board.full?
  #     turn_prompt
  #     board.update
  #     board.show
  #   end
  # end

  # def turn_prompt
  #   board.valid_move?
  # end

  # def winner?
  #   board.row_victory? || board.column_victory? || board.diagonal.victory?
  # end

  # def game_over; end
end
