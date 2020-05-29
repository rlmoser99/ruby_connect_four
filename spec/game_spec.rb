# frozen_string_literal: true

# spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/player'
# require_relative '../lib/board'
# require_relative '../lib/display'

# rubocop:disable Layout/LineLength
describe Game do
  context 'has board, 2 players, and current_player' do
    it { is_expected.to respond_to(:board, :player1, :player2, :current_player) }
  end
  context '#switch_current_player' do
    before do
      subject.player1 = instance_double(Player)
      subject.player2 = instance_double(Player)
    end
    context 'current player begins as #1' do
      it 'changes to player #2' do
        subject.current_player = subject.player1
        expect { subject.switch_current_player }.to change { subject.current_player }.to be(subject.player2)
      end
    end
    context 'current player begins as #2' do
      it 'changes to player #1' do
        subject.current_player = subject.player2
        expect { subject.switch_current_player }.to change { subject.current_player }.to be(subject.player1)
      end
    end
  end
end
# rubocop:enable Layout/LineLength
