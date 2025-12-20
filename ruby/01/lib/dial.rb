# frozen_string_literal: true

require_relative "direction"

class Dial
  include Direction

  LIMIT = 100

  attr_reader :position, :zero_landings, :zero_passes

  def initialize
    @position = LIMIT / 2
    @zero_landings = 0
    @zero_passes = 0
  end

  def turn(dir, count)
    dir = normalize_dir(dir)
    delta = get_delta(dir, count)
    result = position + delta

    if Integer(count) > LIMIT || result.abs > LIMIT
      @zero_passes += String(count)[0...-2].to_i
    elsif result.negative?
      @zero_passes += 1
    end

    @position = result % LIMIT
    @zero_landings += 1 if position.zero?
  end

  private

  def normalize_dir(dir)
    dir = dir.to_s.upcase.strip

    unless ACCEPTED_DIRS.include?(dir)
      raise "unknown direction `#{dir}`, must be one of #{ACCEPTED_DIRS}"
    end

    dir
  end

  def get_delta(dir, count)
    count = Integer(count) % LIMIT
    (dir == DIR_LEFT) ? -count : count
  end
end
