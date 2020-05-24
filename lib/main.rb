# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'player.rb'

game = Game.new
game.play_game

# RED = "\e[31m\u2B24\e[0m"
# YELLOW = "\e[33m\u2B24\e[0m"
# OPEN = "\u2B24"
# ONE = "\e[32m\u2460\e[0m"
# TWO = "\e[32m\u2461\e[0m"
# THREE = "\e[32m\u2462\e[0m"
# FOUR = "\e[32m\u2463\e[0m"
# FIVE = "\e[32m\u2464\e[0m"
# SIX = "\e[32m\u2465\e[0m"
# SEVEN = "\e[32m\u2466\e[0m"

# labels = [' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ']
# labels.each { |label| print label }
# puts ''
# puts " #{ONE}  #{TWO}  #{THREE}  #{FOUR}  #{FIVE}  #{SIX}  #{SEVEN}"

# board = Array.new(6) { Array.new(7, " #{OPEN} ") }
# board = Array.new(6) { Array.new(7, '') }
# board[5][0] = '1'
# board[5][1] = '2'
# board.each do |row|
#   row.each do |cell|
#     print " #{OPEN} " if cell == ''
#     print " #{YELLOW} " if cell == '1'
#     print " #{RED} " if cell == '2'
#   end
#   puts ''
# end

# puts 'Traditional Game Pieces'
# puts "\u26AB"
# puts "\u26AA"
# ONE = "\u2460"
# TWO = "\u2461"
# THREE = "\u2462"
# FOUR = "\u2463"
# FIVE = "\u2464"
# SIX = "\u2465"
# SEVEN = "\u2466"
# PINK = "\e[35m\u2B24\e[0m"
# GREEN = "\e[32m\u2B24\e[0m"
# PURPLE = "\e[34m\u2B24\e[0m"
# TEAL = "\e[36m\u2B24\e[0m"
