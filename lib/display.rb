# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Text Content for Connect Four game
module Display
  OPEN = "\u26AB "
  RED_CHIP = "\u{1F534} "
  BLUE_CHIP = "\u{1F535} "

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
    "\n\n\e[32mCongratulations, #{player.name}! You won this game!\e[0m\n\n"
  end

  def display_draw
    "\n\nThat was a tough game, and it's a tie.\n\n"
  end

  def display_exit
    "\n\nCurrent game has ended.\n\n"
  end

  def display_play_again(first_player, second_player)
    <<~HEREDOC

    
      #{first_player.name} and #{second_player.name}, do you want to play again?

      Press '\e[32my\e[0m' for yes, or any other key to exit."
    HEREDOC
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
    puts "  \e[32m\u2460\e[0m    \e[32m\u2461\e[0m    \e[32m\u2462\e[0m    \e[32m\u2463\e[0m    \e[32m\u2464\e[0m    \e[32m\u2465\e[0m    \e[32m\u2466\e[0m"
    puts '|----+----+----+----+----+----+----|'
    display_board
  end

  def display_board
    board.each do |row|
      print '|'
      row_output(row)
      puts ''
      puts '|----+----+----+----+----+----+----|'
    end
  end

  def row_output(row)
    row.each do |cell|
      print " #{OPEN}" if cell == ''
      print " #{RED_CHIP}" if cell == '1'
      print " #{BLUE_CHIP}" if cell == '2'
      print ' |'
    end
  end

  # def display_board
  #   puts '|----+----+----+----+----+----+----|'
  #   board.each do |row|
  #     print '|'
  #     row.each do |cell|
  #       print " #{OPEN}" if cell == ''
  #       print " #{RED_CHIP}" if cell == '1'
  #       print " #{BLUE_CHIP}" if cell == '2'
  #       print ' |'
  #     end
  #     puts ''
  #     puts '|----+----+----+----+----+----+----|'
  #   end
  # end
end
# rubocop:enable Layout/LineLength
