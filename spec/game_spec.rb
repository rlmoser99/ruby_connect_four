# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength, Layout/LineLength
describe Game do
  context 'has board, player1, player2, and current_player' do
    it { is_expected.to respond_to(:board, :player1, :player2, :current_player) }
  end
  before do
    subject.player1 = instance_double(Player)
    subject.player2 = instance_double(Player)
  end
  describe '#switch_current_player' do
    context 'when #1 was current_player' do
      it 'changes to player #2' do
        subject.current_player = subject.player1
        expect { subject.switch_current_player }.to change { subject.current_player }.to be(subject.player2)
      end
    end
    context 'when #2 was current_player' do
      it 'changes to player #1' do
        subject.current_player = subject.player2
        expect { subject.switch_current_player }.to change { subject.current_player }.to be(subject.player1)
      end
    end
  end
  context '#player_input' do
    context 'when input is 1-7' do
      it 'returns input' do
        expect(subject.player_input('3')).to eq('3')
      end
    end
    context 'when input is exit' do
      it 'returns input' do
        expect(subject.player_input('exit')).to eq('exit')
      end
    end
  end
  context '#verify_input' do
    context 'when input is a board.valid_move?' do
      it 'returns input' do
        board = double(Board, valid_move?: true)
        expect(board.valid_move?).to be true
        expect(subject.verify_input(subject.player1, '3')).to eq('3')
      end
    end
    context 'when input is exit' do
      it 'returns exit' do
        expect(subject.verify_input(subject.player1, 'exit')).to eq('exit')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Layout/LineLength
