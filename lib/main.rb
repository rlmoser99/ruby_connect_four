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

# COLOR31 = "\e[31m\u2B24\e[0m "
# COLOR32 = "\e[32m\u2B24\e[0m "
# COLOR33 = "\e[33m\u2B24\e[0m "
# COLOR34 = "\e[34m\u2B24\e[0m "
# COLOR35 = "\e[35m\u2B24\e[0m "
# COLOR36 = "\e[36m\u2B24\e[0m "
# COLOR37 = "\e[37m\u2B24\e[0m "
# COLOR38 = "\e[38m\u2B24\e[0m "
# COLOR39 = "\e[39m\u2B24\e[0m "
# puts "31 #{COLOR31}"
# puts "32 #{COLOR32}"
# puts "33 #{COLOR33}"
# puts "34 #{COLOR34}"
# puts "35 #{COLOR35}"
# puts "36 #{COLOR36}"
# puts "37 #{COLOR37}"
# puts "38 #{COLOR38}"

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
