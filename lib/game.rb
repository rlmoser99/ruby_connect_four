# frozen_string_literal: true

require_relative './display'

# Order of the Connect Four Game
class Game
  include Display
  attr_accessor :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
  end

  def start_game
    puts display_title
    puts display_welcome
    @player1 = create_player(1)
    @player2 = create_player(2)
    play_game
  end

  def play_game
    board.display_game
    turn_order
    game_over
  end

  def create_player(number)
    puts display_name(number)
    name = gets.chomp
    Player.new(name, number)
  end

  def turn_order
    @current_player = player1
    loop do
      player_column = turn_prompt(@current_player)
      break if player_column.downcase == 'exit'

      board.update(player_column.to_i - 1, @current_player)
      board.display_game
      break if board.complete?

      switch_current_player
    end
  end

  def switch_current_player
    @current_player = @current_player == player1 ? player2 : player1
  end

  def turn_prompt(player)
    loop do
      @column = user_input(display_turn_prompt(player), /^[1-7]$|^exit$/i)
      break if @column.downcase == 'exit'
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

  def game_over
    unless board.full? || @column.downcase == 'exit'
      puts display_winner(@current_player)
    end
    puts display_draw if board.full?
    repeat_game unless @column.downcase == 'exit'
  end

  def repeat_game
    puts display_play_again(player1, player2)
    repeat = gets.chomp
    return unless repeat == 'y'

    @board = Board.new
    play_game
  end
end
