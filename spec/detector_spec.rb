# frozen_string_literal: true

require_relative '../lib/detector'

describe Detector do
  subject(:detect) { described_class.new }

  describe '#connect_four?' do
    context 'array has four of the same value' do
      it 'has a connect four' do
        four_in_a_row = detect.connect_four?(%w[1 1 1 1 2 1 2])
        expect(four_in_a_row).to be true
      end
    end

    context 'array does not have four of the same value' do
      it 'does not have a connect four' do
        no_connect_four = detect.connect_four?(%w[1 2 1 1 2 2 1])
        expect(no_connect_four).to be false
      end
    end
  end
end
