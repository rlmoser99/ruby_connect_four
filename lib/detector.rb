# frozen_string_literal: true

# Player Information for Connect Four
class Detector
  def initialize
    @full_row = []
    @unique_four = []
  end

  def connect_four?(array)
    update_arrays(array)
    @unique_four.any? { |unique| unique.size == 1 && unique[0] != '' }
  end

  private

  def update_arrays(array)
    @full_row = array
    repeat = @full_row.length - 3
    repeat.times do |num|
      @unique_four << array[num..num + 3].uniq
    end
  end
end
