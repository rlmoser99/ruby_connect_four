# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject { described_class.new('foo', 1) }
  context 'has name and number' do
    it { is_expected.to respond_to(:name, :number) }
  end
end
