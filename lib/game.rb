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
      @column = player_turn_input(@current_player)
      break if @column.downcase == 'exit'

      board.update(@column.to_i - 1, @current_player)
      board.display_game
      break if board.complete?

      switch_current_player
    end
  end

  def player_turn_input(player)
    verify_input(player, player_input(turn_prompt(player)))
  end

  def verify_input(player, input)
    return 'exit' if input.downcase == 'exit'
    return input if board.valid_move?(input.to_i - 1)

    puts display_column_full
    verify_input(player, player_input(turn_prompt(player)))
  end

  def player_input(input)
    return input if valid_input?(input)

    puts display_column_warning
    player_input(turn_prompt(@current_player))
  end

  def turn_prompt(player)
    puts display_turn_prompt(player)
    gets.chomp
  end

  def valid_input?(input)
    input.match?(/^[1-7]$|^exit$/i)
  end

  def switch_current_player
    @current_player = @current_player == player1 ? player2 : player1
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
