# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
describe Game do
  subject(:game) { described_class.new }
  before do
    game.board = instance_double(Board, display_game: nil, complete?: true)
    game.player1 = instance_double(Player)
    game.player2 = instance_double(Player)
  end

  describe '#initialize' do
    it 'has a board' do
      expect(game).to respond_to(:board)
    end
  end

  describe '#start_game' do
    it 'starts the game' do
      expect(game).to receive(:puts)
      expect(game).to receive(:display_title)
      expect(game).to receive(:puts)
      expect(game).to receive(:display_welcome)
      expect(game).to receive(:create_player).with(1)
      expect(game).to receive(:create_player).with(2)
      expect(game).to receive(:play_game)
      game.start_game
    end
  end

  describe '#play_game' do
    it 'plays the game' do
      expect(game.board).to receive(:display_game)
      expect(game).to receive(:turn_order)
      expect(game).to receive(:game_over)
      game.play_game
    end
  end

  describe '#create_player' do
    it 'creates one player' do
      player_number = 1
      expect(game).to receive(:puts)
      expect(game).to receive(:display_name).with(1)
      allow(game).to receive(:gets).and_return('PlayerName')
      expect(Player).to receive(:new).with('PlayerName', player_number)
      game.create_player(player_number)
    end
  end

  describe '#turn_order' do
    context 'when player column input is exit' do
      before do
        game.instance_variable_set(:@current_player, game.player1)
        game.instance_variable_set(:@column, 'exit')
      end

      it 'exits loop before switching current player' do
        expect(game).to receive(:player_turn_input).with(game.current_player).and_return('exit')
        expect(game).not_to receive(:switch_current_player)
        game.turn_order
      end
    end

    context 'when board is complete' do
      player_input = '2'
      player_input_column = 1

      before do
        game.board = instance_double(Board, display_game: nil, complete?: true)
        game.instance_variable_set(:@current_player, game.player1)
        game.instance_variable_set(:@column, player_input)
      end

      it 'exits loop before switching curent player' do
        expect(game).to receive(:player_turn_input).with(game.current_player).and_return(player_input)
        expect(game.board).to receive(:update).with(player_input_column, game.current_player)
        expect(game.board).to receive(:display_game)
        expect(game).not_to receive(:switch_current_player)
        game.turn_order
      end
    end
  end

  describe '#player_turn_input' do
    it 'returns a column number' do
      player_input = '4'
      expect(game).to receive(:player_turn_input).with(game.current_player).and_return(player_input)
      column = game.player_turn_input(game.current_player)
      expect(column).to eq(player_input)
    end
  end

  describe '#verify_input' do
    context 'when input is exit' do
      it 'returns exit' do
        exit_input = 'exit'
        verified_input = game.verify_input(game.player1, exit_input)
        expect(verified_input).to eq('exit')
      end
    end

    context 'when input is a valid_move?' do
      before do
        game.board = instance_double(Board, valid_move?: true)
      end

      it 'returns input' do
        number_input = '3'
        verified_input = game.verify_input(game.player1, number_input)
        expect(verified_input).to eq('3')
      end
    end
  end

  describe '#player_input' do
    context 'when input is 1-7' do
      it 'returns valid number input' do
        number_input = '3'
        valid_input = game.player_input(number_input)
        expect(valid_input).to eq('3')
      end
    end

    context 'when input is exit' do
      it 'returns valid exit input' do
        exit_input = 'exit'
        valid_input = game.player_input(exit_input)
        expect(valid_input).to eq('exit')
      end
    end
  end

  describe '#turn_prompt' do
    before do
      game.player1 = instance_double(Player, name: 'One', number: 1)
      game.instance_variable_set(:@current_player, game.player1)
    end

    it 'returns player input' do
      prompt = "\n\n#{game.player1.name}, enter a column number (1-7) to drop a \u{1F534}  or 'exit' to end the game. "
      user_input = '2'
      expect(game).to receive(:puts).once.with(prompt)
      expect(game).to receive(:gets).and_return(user_input)
      result = game.turn_prompt(game.current_player)
      expect(result).to eq(user_input)
    end
  end

  describe '#valid_input?' do
    context 'when user input is 1-digit from 1-7' do
      it 'validates user input' do
        user_input = '2'
        result = game.valid_input?(user_input)
        expect(result).to be true
      end
    end

    context 'when user input is exit' do
      it 'validates user input' do
        user_input = 'exit'
        result = game.valid_input?(user_input)
        expect(result).to be true
      end
    end

    context 'when user input is not 1-digit from 1-7 or exit' do
      it 'invalidates user input' do
        user_input = 's'
        result = game.valid_input?(user_input)
        expect(result).to be false
      end
    end
  end

  describe '#switch_current_player' do
    context 'when #1 was current_player' do
      it 'changes current_player to #2' do
        game.current_player = game.player1
        expect { game.switch_current_player }.to change { game.current_player }.to be(game.player2)
      end
    end

    context 'when #2 was current_player' do
      it 'changes current_player to #1' do
        game.current_player = game.player2
        expect { game.switch_current_player }.to change { game.current_player }.to be(game.player1)
      end
    end
  end

  describe '#game_over' do
    context 'when board is full' do
      before do
        game.board = instance_double(Board, full?: true)
        # game.instance_variable_set(:@column, '3')
      end
    end

    context 'when column input is exit' do
    end

    context 'when board is not full' do
    end
  end

  describe '#repeat_game' do; end
end
# rubocop:enable

# This method is a PROTECTED method and it does NOT need to be tested.
# This method is only used as parameter for the #verify_input method.
# It is unneccessary to test methods that only contain puts and/or gets because they are well-tested in the standard ruby library.
# However, if this test was public (instead of protected) and you had to test it, you'll need to create a stub for the gets method
# https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/method-stubs/stub-with-substitute-implementation

# describe '#player_input' do
#   it 'outputs a phrase' do
#     prompt = "Choose 1-digit between 0-9\n"
#     expect { game.player_input }.to output(prompt).to_stdout
#   end

#   it 'is equal to the return value of the gets method stub' do
#     allow(game).to receive(:gets).and_return('3')
#     input = game.player_input
#     expect(input).to eq('3')
#   end
# end

# This test is not neccessary, because this recursive method will repeat until a valid argument is given, due to a regex check.
# This test uses a stub to 'fake' that when it receives verify_method that it returns 7 no matter what.
# Therefore, this test really only proves that the stub works, not that the method works!

# describe '#verify_input' do
#   context 'when using a stub to fake an in-valid input as argument' do
#     it 'returns valid input' do
#       user_input = 'g'
#       allow(game).to receive(:verify_input).and_return('5')
#       verified_input = game.verify_input(user_input)
#       expect(game).to have_received(:verify_input).with('g')
#       expect(verified_input).to eq('5')
#     end
#   end
