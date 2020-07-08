# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Style/WordArray
describe Board do
  subject(:game) { described_class.new }
  let(:player1) { Player.new('test', 1) }

  describe '#initialize' do
    it 'creates an empty grid of 6 rows by 7 columns' do
      empty_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '']
      ]
      board = game.board
      expect(board).to eql(empty_array)
    end
  end

  describe '#valid_move?' do
    before do
      game.board = [
        ['2', '2', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '1', '2', '2', '1', '2']
      ]
    end

    context 'column has open slots' do
      it 'is a valid move' do
        open_column = 2
        open_column_move = game.valid_move?(open_column)
        expect(open_column_move).to be true
      end
    end

    context 'column is full' do
      it 'is not a valid move' do
        full_column = 1
        full_column_move = game.valid_move?(full_column)
        expect(full_column_move).to be false
      end
    end
  end

  describe '#update' do
    before :each do
      game.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '', '', '']
      ]
    end

    context 'column is empty' do
      it 'updates bottom row' do
        result = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '', '', '', '', ''],
          ['2', '2', '', '', '', '', ''],
          ['1', '2', '', '', '1', '', '']
        ]
        open_column = 4
        updated_board = game.update(open_column, player1)
        expect(updated_board).to eql(result)
      end
    end

    context 'column has a some values' do
      it 'updates lowest empty row' do
        result = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '1', '', '', '', '', ''],
          ['2', '2', '', '', '', '', ''],
          ['1', '2', '', '', '', '', '']
        ]
        open_column = 1
        updated_board = game.update(open_column, player1)
        expect(updated_board).to eql(result)
      end
    end
  end

  describe '#full?' do
    context 'board is full' do
      it 'is true' do
        game.board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(game.full?).to be true
      end
    end
    context 'board is not full' do
      it 'is false' do
        game.board = [
          ['2', '2', '1', '2', '', '', ''],
          ['1', '1', '2', '2', '', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(game.full?).to be false
      end
    end
  end

  describe '#row_victory?' do
    context 'row has four-in-a-row' do
      it 'is true' do
        game.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.row_victory?).to be true
      end
    end

    context 'row does not have four-in-a-row' do
      it 'is false' do
        game.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.row_victory?).to be false
      end
    end
  end

  describe '#column_victory?' do
    context 'column has four-in-a-row' do
      it 'is true' do
        game.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.column_victory?).to be true
      end
    end

    context 'column does not have four-in-a-row' do
      it 'is false' do
        game.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.column_victory?).to be false
      end
    end
  end

  describe '#diagonal_victory?' do
    context 'has a diagonal four-in-a-row' do
      it 'is true' do
        game.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.diagonal_victory?).to be true
      end

      it 'is true' do
        game.board = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
          ['2', '1', '1', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', '']
        ]
        expect(game.diagonal_victory?).to be true
      end
    end

    context 'does not have a diagonal four-in-a-row' do
      it 'is false' do
        game.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.diagonal_victory?).to be false
      end
    end
  end

  describe '#complete?' do
    context 'board has four-in-a-row' do
      it 'is true' do
        game.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.complete?).to be true
      end
    end

    context 'board is full' do
      it 'is true' do
        game.board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(game.complete?).to be true
      end
    end

    context 'board is not full or have four-in-a-row' do
      it 'is false' do
        game.board = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '2', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(game.complete?).to be false
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Style/WordArray
