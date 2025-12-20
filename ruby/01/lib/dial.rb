class Dial
  attr_reader :position, :zero_landings, :zero_passes

  def initialize
    @position = 50
    @zero_landings = 0
    @zero_passes = 0
  end

  def turn(rotation, clicks)
    delta = rotation == "L" ? -1 : 1

    while clicks > 0 do
      @position = position + delta
      @position = 99 if position === -1
      @position = 0 if position == 100

      @zero_passes += 1 if clicks > 0 && position.zero?

      clicks -= 1
    end

    @zero_landings += 1 if position.zero?
  end
end
