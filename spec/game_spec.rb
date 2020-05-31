# frozen_string_literal: true

# spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/player'

# rubocop:disable Layout/LineLength
describe Game do
  context 'has board, player1, player2, and current_player' do
    it { is_expected.to respond_to(:board) }
    it { is_expected.to respond_to(:player1) }
    it { is_expected.to respond_to(:player2) }
    it { is_expected.to respond_to(:current_player) }
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
end
# rubocop:enable Layout/LineLength
