# frozen_string_literal: true

# Player Information for Connect Four
class Detector
  def connect_four?(array)
    array.uniq.size == 1 && array[0] != ''
  end
end
