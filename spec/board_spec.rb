# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/detector'

# rubocop:disable Metrics/BlockLength, Style/WordArray

describe GameBoard do
  subject(:game_board) { described_class.new }
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
      board = game_board.board
      expect(board).to eql(empty_array)
    end
  end

  describe '#valid_move?' do
    before do
      valid_example = [
        ['2', '2', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['2', '2', '1', '2', '2', '1', '2']
      ]
      game_board.instance_variable_set(:@board, valid_example)
    end

    context 'column has open slots' do
      it 'is a valid move' do
        open_column = 2
        open_column_move = game_board.valid_move?(open_column)
        expect(open_column_move).to be true
      end
    end

    context 'column is full' do
      it 'is not a valid move' do
        full_column = 1
        full_column_move = game_board.valid_move?(full_column)
        expect(full_column_move).to be false
      end
    end
  end

  describe '#update' do
    before do
      update_example = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '', '', '']
      ]
      game_board.instance_variable_set(:@board, update_example)
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
        updated_board = game_board.update(open_column, player1)
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
        updated_board = game_board.update(open_column, player1)
        expect(updated_board).to eql(result)
      end
    end
  end

  describe '#full?' do
    context 'board is full' do
      it 'is full' do
        full_board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        game_board.instance_variable_set(:@board, full_board)
        expect(game_board).to be_full
      end
    end

    context 'board is not full' do
      it 'is not full' do
        open_board = [
          ['2', '2', '1', '2', '', '', ''],
          ['1', '1', '2', '2', '', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        game_board.instance_variable_set(:@board, open_board)
        expect(game_board).not_to be_full
      end
    end
  end

  describe '#row_victory?' do
    context 'row has four-in-a-row' do
      it 'is a victory' do
        row_victory = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, row_victory)
        expect(game_board).to be_row_victory
      end
    end

    context 'row does not have four-in-a-row' do
      it 'is not a victory' do
        no_victory = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, no_victory)
        expect(game_board).not_to be_row_victory
      end
    end
  end

  describe '#column_victory?' do
    context 'column has four-in-a-row' do
      it 'is a victory' do
        column_victory = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, column_victory)
        expect(game_board).to be_column_victory
      end
    end

    context 'column does not have four-in-a-row' do
      it 'is not a victory' do
        no_victory = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, no_victory)
        expect(game_board).not_to be_column_victory
      end
    end
  end

  describe '#diagonal_victory?' do
    context 'has a diagonal four-in-a-row' do
      it 'is a victory' do
        diagonal_victory = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, diagonal_victory)
        expect(game_board).to be_diagonal_victory
      end

      it 'is a victory' do
        diagonal_victory = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
          ['2', '1', '1', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', '']
        ]
        game_board.instance_variable_set(:@board, diagonal_victory)
        expect(game_board).to be_diagonal_victory
      end
    end

    context 'does not have a diagonal four-in-a-row' do
      it 'is not a victory' do
        no_victory = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, no_victory)
        expect(game_board).not_to be_diagonal_victory
      end
    end
  end

  describe '#complete?' do
    context 'board has four-in-a-row' do
      it 'is complete' do
        victory_board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, victory_board)
        expect(game_board).to be_complete
      end
    end

    context 'board is full' do
      it 'is true' do
        full_board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        game_board.instance_variable_set(:@board, full_board)
        expect(game_board).to be_complete
      end
    end

    context 'board is not full or have four-in-a-row' do
      it 'is not complete' do
        incomplete_board = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '2', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        game_board.instance_variable_set(:@board, incomplete_board)
        expect(game_board).not_to be_complete
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Style/WordArray
