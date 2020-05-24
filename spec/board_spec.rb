# frozen_string_literal: true

# spec/board_spec.rb
require_relative '../lib/board'
require_relative '../lib/display'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Style/WordArray
describe Board do
  let(:example) { Board.new }
  let(:player) { Player.new('test', 1) }
  context '#initialize' do
    it 'creates an empty grid of 6 rows by 7 columns' do
      empty_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '']
      ]
      expect(example.board).to eql(empty_array)
    end
  end
  context '#valid_move?' do
    before :each do
      example.board = [
        ['2', '2', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '1', '2', '2', '1', '2']
      ]
    end
    it 'returns truthy if column has empty places' do
      expect(example.valid_move?(2)).to be_truthy
    end
    it 'returns falsey if column does not have empty places' do
      expect(example.valid_move?(1)).to be_falsey
    end
  end
  context '#update' do
    before :each do
      example.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '', '', '']
      ]
    end
    it 'updates bottom row if entire column is empty' do
      solution = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '1', '', '']
      ]
      expect(example.update(4, player)).to eql(solution)
    end
    it 'updates lowest empty row if columns has some values' do
      solution = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '', '', '']
      ]
      expect(example.update(1, player)).to eql(solution)
    end
  end
  context '#full?' do
    it 'returns true when board is full' do
      example.board = [
        ['2', '2', '1', '2', '2', '2', '1'],
        ['1', '1', '2', '2', '1', '1', '2'],
        ['2', '1', '1', '1', '2', '2', '1'],
        ['1', '2', '2', '2', '1', '1', '2'],
        ['2', '1', '2', '1', '1', '2', '1'],
        ['1', '2', '1', '2', '2', '1', '2']
      ]
      expect(example.full?).to be_truthy
    end
    it 'returns false when board is not full' do
      example.board = [
        ['2', '2', '1', '2', '', '', ''],
        ['1', '1', '2', '2', '', '1', '2'],
        ['2', '1', '1', '1', '2', '2', '1'],
        ['1', '2', '2', '2', '1', '1', '2'],
        ['2', '1', '2', '1', '1', '2', '1'],
        ['1', '2', '1', '2', '2', '1', '2']
      ]
      expect(example.full?).to be_falsey
    end
  end
  context '#row_victory?' do
    it 'returns true when a row has 4 in a row' do
      example.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['1', '1', '1', '1', '', '', ''],
        ['1', '1', '1', '2', '', '', ''],
        ['2', '2', '1', '2', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.row_victory?).to be_truthy
    end
    it 'returns false when no rows has 4 in a row' do
      example.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '1', '1', '', '', ''],
        ['2', '1', '2', '2', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.row_victory?).to be_falsey
    end
  end
  context '#column_victory?' do
    it 'returns true when a column has 4 in a row' do
      example.board = [
        ['1', '', '', '', '', '', ''],
        ['1', '', '', '', '', '', ''],
        ['1', '1', '1', '1', '', '', ''],
        ['1', '1', '1', '2', '', '', ''],
        ['2', '2', '1', '2', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.column_victory?).to be_truthy
    end
    it 'returns false when no columns has 4 in a row' do
      example.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '1', '1', '', '', ''],
        ['2', '1', '2', '2', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.column_victory?).to be_falsey
    end
  end
  context '#diagonal_victory?' do
    it 'returns true when there is 4 in a forward diagonal row' do
      example.board = [
        ['1', '', '', '', '', '', ''],
        ['1', '', '', '', '', '', ''],
        ['1', '1', '1', '1', '', '', ''],
        ['1', '1', '1', '2', '', '', ''],
        ['2', '2', '1', '1', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.diagonal_victory?).to be_truthy
    end
    it 'returns true when there is 4 in a backward diagonal row' do
      example.board = [
        ['1', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '1', '1', '', '', ''],
        ['1', '2', '1', '2', '', '', ''],
        ['2', '1', '1', '1', '', '', ''],
        ['1', '2', '2', '2', '', '', '']
      ]
      expect(example.diagonal_victory?).to be_truthy
    end
    it 'returns false when there is not 4 in a diagonal row' do
      example.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '1', '1', '', '', ''],
        ['2', '1', '2', '2', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.diagonal_victory?).to be_falsey
    end
  end
  context '#complete?' do
    it 'returns true when the board is full or four-in-a-row' do
      example.board = [
        ['1', '', '', '', '', '', ''],
        ['1', '', '', '', '', '', ''],
        ['1', '1', '1', '1', '', '', ''],
        ['1', '1', '1', '2', '', '', ''],
        ['2', '2', '1', '1', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.complete?).to be_truthy
    end
    it 'returns false when the board is not full or four-in-a-row' do
      example.board = [
        ['1', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '2', '1', '', '', ''],
        ['1', '2', '2', '2', '', '', ''],
        ['2', '2', '1', '1', '', '', ''],
        ['1', '2', '2', '1', '', '', '']
      ]
      expect(example.complete?).to be_falsey
    end
  end
end
# rubocop:enable Metrics/BlockLength, Style/WordArray
