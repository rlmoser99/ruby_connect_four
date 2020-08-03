# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/detector'

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@first_player, instance_double(Player))
    game.instance_variable_set(:@second_player, instance_double(Player))
    game.instance_variable_set(:@board, instance_double(GameBoard))
  end

  describe '#start_game' do
    it 'creates two players' do
      allow(game).to receive(:puts).twice
      allow(game).to receive(:display_title)
      allow(game).to receive(:display_welcome)
      allow(game).to receive(:play_game)
      expect(game).to receive(:create_player).once.with(1)
      expect(game).to receive(:create_player).once.with(2)
      game.start_game
    end
  end

  describe '#create_player' do
    it 'creates one player' do
      player_number = 1
      allow(game).to receive(:puts)
      allow(game).to receive(:display_name).with(1)
      allow(game).to receive(:gets).and_return('PlayerName')
      expect(Player).to receive(:new).with('PlayerName', player_number)
      game.create_player(player_number)
    end
  end

  describe '#update_board' do
    it 'updates the board' do
      user_input = 2
      allow(game.board).to receive(:display_game)
      expect(game.board).to receive(:update).with(user_input, game.first_player)
      game.update_board(user_input, game.first_player)
    end
  end
end
# rubocop:enable Metrics/BlockLength
