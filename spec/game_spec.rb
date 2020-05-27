# frozen_string_literal: true

# spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/player'
# require_relative '../lib/board'
# require_relative '../lib/display'

# rubocop:disable Layout/LineLength
describe Game do
  let(:player1) { Player.new('foo', 1) }
  let(:player2) { Player.new('bar', 2) }
  context '#switch_current_player' do
    it 'returns player 1 if player 2 was previous player' do
      game = double
      allow(game).to receive(:switch_current_player).with(player1).and_return(player2)
    end
  end
end
# rubocop:enable Layout/LineLength
