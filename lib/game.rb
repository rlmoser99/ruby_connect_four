# frozen_string_literal: true

require './display'

# Order of the Connect Four Game
class Game
  include Display
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    play_game
  end

  def play_game
    puts display_welcome
    # @player1 = create_player(1)
    # @player2 = create_player(2)
    # board.display_board
    # turn_order
    # puts board.full?
    # puts board.row_victory?
    puts board.diagonal_victory?
  end

  def create_player(number)
    puts display_name(number)
    name = gets.chomp
    Player.new(name, number)
  end

  def turn_order
    current_player = player1
    player_column = turn_prompt(current_player)
    board.update(player_column.to_i - 1, current_player)
    board.display_board
    #  until winner? || board.full?
    #  end
  end

  def turn_prompt(player)
    loop do
      @column = user_input(display_turn_prompt(player), /^[1-7]$/)
      break if board.valid_move?(@column.to_i - 1)

      puts display_column_full
    end
    @column
  end

  def user_input(prompt, regex)
    loop do
      print prompt
      input = gets.chomp
      input.match(regex) ? (return input) : print(display_column_warning)
    end
  end

  # def winner?
  #   board.row_victory? || board.column_victory? || board.diagonal.victory?
  # end

  # def game_over; end
end
