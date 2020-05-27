# frozen_string_literal: true

# spec/board_spec.rb
require_relative '../lib/board'
require_relative '../lib/display'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Style/WordArray
describe Board do
  # let(:player) { Player.new('test', 1) }
  let(:player1) { Player.new('test', 1) }
  subject { described_class.new }
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
      expect(subject.board).to eql(empty_array)
    end
  end
  context '#valid_move?' do
    before do
      subject.board = [
        ['2', '2', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '1', '', '', '', '', ''],
        ['1', '2', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '1', '2', '2', '1', '2']
      ]
    end
    context 'column is empty' do
      it 'should be true' do
        expect(subject.valid_move?(2)).to be true
      end
    end
    context 'column is full' do
      it 'should be false' do
        expect(subject.valid_move?(1)).to be false
      end
    end
  end
  context '#update' do
    before :each do
      subject.board = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '', '', '', '', ''],
        ['1', '2', '', '', '', '', '']
      ]
    end
    context 'column is empty' do
      it 'should update bottom row' do
        solution = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '', '', '', '', ''],
          ['2', '2', '', '', '', '', ''],
          ['1', '2', '', '', '1', '', '']
        ]
        expect(subject.update(4, player1)).to eql(solution)
      end
    end
    context 'column has a some values' do
      it 'should update lowest empty row' do
        solution = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '1', '', '', '', '', ''],
          ['2', '2', '', '', '', '', ''],
          ['1', '2', '', '', '', '', '']
        ]
        expect(subject.update(1, player1)).to eql(solution)
      end
    end
  end
  context '#full?' do
    context 'board is full' do
      it 'should be true' do
        subject.board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(subject.full?).to be true
      end
    end
    context 'board is not full' do
      it 'should be false' do
        subject.board = [
          ['2', '2', '1', '2', '', '', ''],
          ['1', '1', '2', '2', '', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(subject.full?).to be false
      end
    end
  end
  context '#row_victory?' do
    context 'row has four-in-a-row' do
      it 'should be true' do
        subject.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.row_victory?).to be true
      end
    end
    context 'row does not have four-in-a-row' do
      it 'should be false' do
        subject.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.row_victory?).to be false
      end
    end
  end
  context '#column_victory?' do
    context 'column has four-in-a-row' do
      it 'should be true' do
        subject.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.column_victory?).to be true
      end
    end
    context 'column does not have four-in-a-row' do
      it 'should be false' do
        subject.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.column_victory?).to be false
      end
    end
  end
  context '#diagonal_victory?' do
    context 'there is a diagonal four-in-a-row' do
      it 'should be true' do
        subject.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.diagonal_victory?).to be true
      end
      it 'should be true' do
        subject.board = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
          ['2', '1', '1', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', '']
        ]
        expect(subject.diagonal_victory?).to be true
      end
    end
    context 'there is not a diagonal four-in-a-row' do
      it 'should be false' do
        subject.board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['2', '1', '', '', '', '', ''],
          ['1', '2', '1', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.diagonal_victory?).to be false
      end
    end
  end
  context '#complete?' do
    context 'board has four-in-a-row' do
      it 'should be true' do
        subject.board = [
          ['1', '', '', '', '', '', ''],
          ['1', '', '', '', '', '', ''],
          ['1', '1', '1', '1', '', '', ''],
          ['1', '1', '1', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.complete?).to be true
      end
    end
    context 'board is full' do
      it 'should be true' do
        subject.board = [
          ['2', '2', '1', '2', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '1', '1', '1', '2', '2', '1'],
          ['1', '2', '2', '2', '1', '1', '2'],
          ['2', '1', '2', '1', '1', '2', '1'],
          ['1', '2', '1', '2', '2', '1', '2']
        ]
        expect(subject.complete?).to be true
      end
    end
    context 'board is not full or have four-in-a-row' do
      it 'should be false' do
        subject.board = [
          ['1', '', '', '', '', '', ''],
          ['2', '', '', '', '', '', ''],
          ['1', '1', '2', '1', '', '', ''],
          ['1', '2', '2', '2', '', '', ''],
          ['2', '2', '1', '1', '', '', ''],
          ['1', '2', '2', '1', '', '', '']
        ]
        expect(subject.complete?).to be false
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Style/WordArray
