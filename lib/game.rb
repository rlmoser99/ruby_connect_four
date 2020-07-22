# frozen_string_literal: true

require_relative './display'

# Order of the Connect Four Game
class Game
  include Display
  attr_reader :board, :first_player, :second_player, :current_player

  def initialize
    @board = GameBoard.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def start_game
    puts display_title
    puts display_welcome
    @first_player = create_player(1)
    @second_player = create_player(2)
    play_game
  end

  def play_game
    board.display_game
    @current_player = first_player
    turn_order
    game_over
  end

  def create_player(number)
    puts display_name(number)
    name = gets.chomp
    Player.new(name, number)
  end

  def turn_order
    loop do
      column = player_turn_input(@current_player)
      break if column.downcase == 'exit'

      update_board(column.to_i - 1, @current_player)
      break if board.complete?

      switch_current_player
    end
  end

  def player_turn_input(player)
    verify_input(player, player_input(turn_prompt(player)))
  end

  def verify_input(player, input)
    return input if input.downcase == 'exit'
    return input if board.valid_move?(input.to_i - 1)

    puts display_column_full
    verify_input(player, player_input(turn_prompt(player)))
  end

  def update_board(column, player)
    board.update(column, player)
    board.display_game
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
    @current_player = @current_player == first_player ? second_player : first_player
  end

  def game_over
    if board.full?
      puts display_draw
    elsif board.complete?
      puts display_winner(@current_player)
    else
      puts display_exit
    end
    repeat_game
  end

  def repeat_game
    puts display_play_again(first_player, second_player)
    repeat = gets.chomp
    return unless repeat == 'y'

    @board = GameBoard.new
    play_game
  end
end
