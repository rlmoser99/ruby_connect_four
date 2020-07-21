# frozen_string_literal: true

# Player Information for Connect Four
class Detector
  def connect_four?(array)
    repeat = divide_array(array)
    repeat.times { |num| return true if four_of_a_kind?(array[num..num + 3]) }
    false
  end

  private

  # :reek:UtilityFunction
  def four_of_a_kind?(array)
    array.uniq.size == 1 && array[0] != ''
  end
  # ....

  # :reek:UtilityFunction
  def divide_array(array)
    array.length - 3
  end
  # ....
end
