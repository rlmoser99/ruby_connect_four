# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/MethodLength

# Text Content for Connect Four game
module Display
  # OPEN = "\u2B24 "
  OPEN = "\u26AB"
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
    "\n\n#{player.name}, enter a column number (1-7) to drop a #{chip_color(player.number)} or 'exit' to end the game. "
  end

  def chip_color(number)
    number == 1 ? RED_CHIP.to_s : BLUE_CHIP.to_s
  end

  def display_column_full
    "\e[31mSorry, that column is full. Please enter a different column.\e[0m"
  end

  def display_column_warning
    "\e[31mSorry, please enter a number 1-7 or 'exit'.\e[0m"
  end

  def display_winner(player)
    "\n\n\e[32mCongratulations, #{player.name} won Connect Four!\e[0m\n\n"
  end

  def display_draw
    "\n\nIt's a tie. What to try again?\n\n"
  end

  def display_title
    system 'clear'
    <<~HEREDOC

                  \e[32mCONNECT FOUR\e[0m

        #{RED_CHIP} Player #1        #{BLUE_CHIP} Player #2
      ------------------------------------

    HEREDOC
  end

  def display_game
    puts display_title
    puts ''
    puts "  #{ONE}    #{TWO}    #{THREE}    #{FOUR}    #{FIVE}    #{SIX}    #{SEVEN}"
    display_board
  end

  def display_board
    puts '|----+----+----+----+----+----+----|'
    board.each do |row|
      print '|'
      row.each do |cell|
        print " #{OPEN}" if cell == ''
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
