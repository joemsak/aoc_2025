# frozen_string_literal: true

class Dial
  ACCEPTED_DIRS = %w[l r].freeze
  LIMIT = 100

  attr_reader :pointing_at

  def initialize
    @pointing_at = 50
  end

  def turn(dir, count)
    dir = String(dir).downcase
    count = Integer(count)

    unless ACCEPTED_DIRS.include?(dir)
      raise "unknown direction `#{dir}`, must be one of #{ACCEPTED_DIRS}"
    end

    if dir == "l"
      if pointing_at + count >= LIMIT
        @pointing_at = @pointing_at + count - LIMIT
      else
        @pointing_at += count
      end
    end

    if dir == "r"
      if (pointing_at - count).negative?
        @pointing_at = @pointing_at - count + LIMIT
      else
        @pointing_at -= count
      end
    end
  end
end
