class Dial
  attr_reader :position

  def initialize
    @position = 50
  end

  def step(rotation)
    delta = rotation == "L" ? -1 : 1
    @position = position + delta
    @position = 99 if position === -1
    @position = 0 if position == 100
  end
end
