# frozen_string_literal: true

# Player Information for Connect Four
class Detector
  def connect_four?(array)
    repeat = divide_array(array)
    repeat.times { |num| return true if four_of_a_kind?(array[num..num + 3]) }
    false
  end

  def empty_row(board, column, tally = Hash.new(0))
    row = board.transpose[column]
    row.each { |cell| tally[cell] += 1 }
    tally[''] - 1
  end

  private

  def four_of_a_kind?(array)
    array.uniq.size == 1 && array[0] != ''
  end

  def divide_array(array)
    array.length - 3
  end
end
