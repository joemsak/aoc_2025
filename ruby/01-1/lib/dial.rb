# frozen_string_literal: true

class Dial
  DIR_LEFT = "L"
  DIR_RIGHT = "R"
  ACCEPTED_DIRS = [DIR_LEFT, DIR_RIGHT].freeze
  DIR_PATTERN = Regexp.new("\\A\\s*(?:#{ACCEPTED_DIRS.join("|")})\\s*", Regexp::IGNORECASE).freeze
  LIMIT = 100

  attr_reader :pointing_at

  def initialize
    @pointing_at = 50
  end

  def turn(dir, count)
    dir = String(dir).upcase

    unless dir.match?(DIR_PATTERN)
      raise "unknown direction `#{dir}`, must be one of #{ACCEPTED_DIRS}"
    end

    count = Integer(count)
    count -= LIMIT until count < LIMIT

    if dir == DIR_LEFT
      @pointing_at -= count
    else
      @pointing_at += count
    end

    if pointing_at >= LIMIT
      @pointing_at -= LIMIT
    elsif pointing_at.negative?
      @pointing_at += LIMIT
    end
  end
end
