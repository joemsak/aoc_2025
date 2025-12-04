# frozen_string_literal: true

require_relative "direction"

class Dial
  LIMIT = 100

  attr_reader :position

  def initialize
    @position = LIMIT / 2
  end

  def turn(dir, count)
    dir = normalize_dir(dir)
    count = normalize_count(count)
    delta = (dir == Direction::DIR_LEFT) ? -count : count

    @position = wrap(position + delta)
  end

  private

  def normalize_dir(dir)
    dir = dir.to_s.upcase.strip

    unless Direction::ACCEPTED_DIRS.include?(dir)
      raise "unknown direction `#{dir}`, must be one of #{Direction::ACCEPTED_DIRS}"
    end

    dir
  end

  def normalize_count(count)
    Integer(count) % LIMIT
  end

  def wrap(pos)
    pos %= LIMIT
    pos
  end
end
