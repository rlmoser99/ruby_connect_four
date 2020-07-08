# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength, Layout/LineLength
describe Game do
  subject(:game) { described_class.new }

  # context 'has board, player1, player2, and current_player' do
  #   it { is_expected.to respond_to(:board, :player1, :player2, :current_player) }
  # end
  before do
    game.player1 = instance_double(Player)
    game.player2 = instance_double(Player)
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
