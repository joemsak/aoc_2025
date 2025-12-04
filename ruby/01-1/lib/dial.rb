# frozen_string_literal: true

class Dial
  DIR_LEFT = "L"
  DIR_RIGHT = "R"
  ACCEPTED_DIRS = [DIR_LEFT, DIR_RIGHT].freeze
  DIR_PATTERN = /\A\s*(L|R)\s*/i
  LIMIT = 100

  attr_reader :pointing_at

  def initialize
    @pointing_at = LIMIT / 2
  end

  def turn(dir, count)
    dir = normalize_dir(dir)
    count = normalize_count(count)

    @pointing_at = wrap(@pointing_at + ((dir == DIR_LEFT) ? -count : count))
  end

  private

  def normalize_dir(dir)
    dir = dir.to_s.upcase.strip
    raise "unknown direction `#{dir}`, must be one of #{ACCEPTED_DIRS}" unless ACCEPTED_DIRS.include?(dir)
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
