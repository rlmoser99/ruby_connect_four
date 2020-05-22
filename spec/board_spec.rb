# frozen_string_literal: true

# spec/board_spec.rb
require_relative '../lib/board'
require_relative '../lib/display'

describe Board do
  context '#initialize' do
    it 'creates an empty grid of 6 rows by 7 columns' do
      example = Board.new
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
end
