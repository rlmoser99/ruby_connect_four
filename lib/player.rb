# frozen_string_literal: true

# Player Information for Connect Four
class Player
  attr_reader :name, :number
  def initialize(name, number)
    @name = name
    @number = number
  end
end
