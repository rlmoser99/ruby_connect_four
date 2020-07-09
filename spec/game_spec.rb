# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength, Layout/LineLength
describe Game do
  subject(:game) { described_class.new }
  before do
    # game.board = instance_double(Board, { display_game: nil })
    game.board = instance_double(Board, display_game: nil)
    game.player1 = instance_double(Player)
    game.player2 = instance_double(Player)
  end

  # context 'has board, player1, player2, and current_player' do
  #   it { is_expected.to respond_to(:board, :player1, :player2, :current_player) }
  # end

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

  describe '#turn_order' do; end
  describe '#player_turn_input' do; end
  describe '#turn_prompt' do; end
  describe '#valid_input?' do; end
  describe '#game_over' do; end
  describe '#repeat_game' do; end

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

  describe '#verify_input' do
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

    context 'when input is exit' do
      it 'returns exit' do
        exit_input = 'exit'
        verified_input = game.verify_input(game.player1, exit_input)
        expect(verified_input).to eq('exit')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Layout/LineLength

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
