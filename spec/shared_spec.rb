# frozen_string_literal: true

RSpec.shared_context 'common' do
  let(:example) { Board.new }
  let(:player) { Player.new('test', 1) }
  let(:empty_array) do
    [
      ['', '', '', '', '', '', ''],
      ['', '', '', '', '', '', ''],
      ['', '', '', '', '', '', ''],
      ['', '', '', '', '', '', ''],
      ['', '', '', '', '', '', ''],
      ['', '', '', '', '', '', '']
    ]
  end
end
