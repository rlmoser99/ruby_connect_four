# frozen_string_literal: true

require_relative './display'

# Order of the Connect Four Game
class Game
  include Display
  attr_accessor :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
  end

  def play_game
    puts display_welcome
    @player1 = create_player(1)
    @player2 = create_player(2)
    board.display_board
    turn_order
  end

  def create_player(number)
    puts display_name(number)
    name = gets.chomp
    Player.new(name, number)
  end

  def turn_order
    @current_player = player1
    #  until board.complete?
    player_column = turn_prompt(@current_player)
    # break if player_column == 'exit'
    board.update(player_column.to_i - 1, @current_player)
    board.display_board
    puts @current_player.number
    @current_player = switch_current_player(@current_player)
    puts @current_player.number
    # need to check for 'exit' from the player's turn_prompt
    #  end
  end

  def switch_current_player(player)
    return player2 if player == player1
    return player1 if player == player2
  end

  def turn_prompt(player)
    loop do
      @column = user_input(display_turn_prompt(player), /^[1-7]$|^exit$/i)
      break if @column == 'exit'
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

  # def game_over; end
end
