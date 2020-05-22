# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/MethodLength

# Text Content for Connect Four game
module Display
  RED = "\e[31m\u2B24\e[0m"
  YELLOW = "\e[33m\u2B24\e[0m"
  OPEN = "\u2B24"
  ONE = "\e[32m\u2460\e[0m"
  TWO = "\e[32m\u2461\e[0m"
  THREE = "\e[32m\u2462\e[0m"
  FOUR = "\e[32m\u2463\e[0m"
  FIVE = "\e[32m\u2464\e[0m"
  SIX = "\e[32m\u2465\e[0m"
  SEVEN = "\e[32m\u2466\e[0m"
  RED_CHIP = "\u{1F534}"
  BLUE_CHIP = "\u{1F535}"

  def display_welcome
    "\n\nLet's play Connect Four!\n\n"
  end

  def display_name(number)
    "What is the name of player ##{number}?"
  end

  def display_turn_prompt(player)
    "\n\n#{player.name}, enter a column number (1-7) to drop a #{chip_color(player.number)} ? "
  end

  def chip_color(number)
    number == 1 ? RED_CHIP.to_s : BLUE_CHIP.to_s
  end

  def display_column_full
    "\e[31mSorry, that column is full. Please enter a different column.\e[0m"
  end

  def display_column_warning
    "\e[31mSorry, please enter a number 1-7 for your turn.\e[0m"
  end

  def display_board
    # system 'clear'
    # board[5][0] = '1'
    # board[5][1] = '2'
    puts "  #{ONE}    #{TWO}    #{THREE}    #{FOUR}    #{FIVE}    #{SIX}    #{SEVEN}"
    puts '|----+----+----+----+----+----+----|'
    board.each do |row|
      print '|'
      row.each do |cell|
        print " #{OPEN} " if cell == ''
        print " #{RED_CHIP}" if cell == '1'
        print " #{BLUE_CHIP}" if cell == '2'
        print ' |'
      end
      puts ''
      puts '|----+----+----+----+----+----+----|'
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/MethodLength
