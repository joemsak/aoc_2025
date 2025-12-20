# frozen_string_literal: true

require_relative "direction"

class Dial
  include Direction

  LIMIT = 100

  attr_reader :position

  def initialize
    @position = LIMIT / 2
  end

  def turn(dir, count)
    dir = normalize_dir(dir)
    count = normalize_count(count)
    delta = get_delta(dir, count)

    @position = wrap(delta)
  end

  private

  def normalize_dir(dir)
    dir = dir.to_s.upcase.strip

    unless ACCEPTED_DIRS.include?(dir)
      raise "unknown direction `#{dir}`, must be one of #{ACCEPTED_DIRS}"
    end

    dir
  end

  def normalize_count(count)
    Integer(count) % LIMIT
  end

  def get_delta(dir, count)
    (dir == DIR_LEFT) ? -count : count
  end

  def wrap(delta)
    (position + delta) % LIMIT
  end
end
