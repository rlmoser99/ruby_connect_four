# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'detector.rb'

def play_game
  game = Game.new
  game.start_game
  repeat_game
end

def repeat_game
  puts 'Would you like to play a new game?'
  puts "Press '\e[32my\e[0m' for yes, or any other key to exit."
  repeat_input = gets.chomp.downcase
  if repeat_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

play_game
