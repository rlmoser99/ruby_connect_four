# frozen_string_literal: true

require_relative '../lib/detector'

describe Detector do
  subject(:detect) { described_class.new }

  describe '#connect_four?' do
    context 'array has four of the same value' do
      it 'has a connect four' do
        same_four = detect.connect_four?(%w[1 1 1 1])
        expect(same_four).to be true
      end
    end

    context 'array does not have four of the same value' do
      it 'does not have a connect four' do
        different_four = detect.connect_four?(%w[1 2 1 1])
        expect(different_four).to be false
      end
    end
  end
end
