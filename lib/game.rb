# frozen_string_literal: true

class Game
  def initialize
    Board.new
    Player.new
    Player.new
  end

  def play_game
    board.show
    turn_order
  end

  def turn_order
    until winner? || board.full?
      turn_prompt
      board.update
      board.show
    end
  end

  def turn_prompt
    board.valid_move?
  end

  def winner?
    board.row_victory? || board.column_victory? || board.diagonal.victory?
  end

  def game_over; end
end
