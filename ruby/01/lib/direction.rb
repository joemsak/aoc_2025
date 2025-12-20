# frozen_string_literal: true

module Direction
  DIR_LEFT = "L"
  DIR_RIGHT = "R"
  ACCEPTED_DIRS = [DIR_LEFT, DIR_RIGHT].freeze
  DIR_PATTERN = /\A\s*(L|R)\s*/i
end
