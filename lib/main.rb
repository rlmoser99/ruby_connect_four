# frozen_string_literal: true

PURPLE = "\e[34m\u2B24\e[0m"
YELLOW = "\e[33m\u2B24\e[0m"
OPEN = "\u2B24"

# puts 'Purple/Blue Dot'
# puts PURPLE
# puts 'Yellow Dot'
# puts YELLOW
# puts 'Open Dot'
# puts OPEN

labels = [' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ']
labels.each { |label| print label }
puts ''

board = Array.new(6) { Array.new(7, " #{OPEN} ") }
board.each do |row|
  row.each { |cell| print cell }
  puts ''
end

# puts 'Red Dot'
# puts "\e[31m\u2B24\e[0m"
# puts 'Green Dot'
# puts "\e[32m\u2B24\e[0m"
# puts 'Pink Dot'
# puts "\e[35m\u2B24\e[0m"
# puts ' Dot'
# puts "\e[36m\u2B24\e[0m"
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
