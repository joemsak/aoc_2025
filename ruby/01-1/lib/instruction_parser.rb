# frozen_string_literal: true

require_relative "dial"

class InstructionParser
  LIST_SPLIT_PATTERN = /(?:\n|,)\s?/
  ACCEPTED_DIRS_PATTERN = Regexp.new("\\A(?:#{Dial::ACCEPTED_DIRS.join("|")})", Regexp::IGNORECASE).freeze
  COUNT_PATTERN = /\d+\z/

  attr_reader :list, :instructions

  def initialize(list)
    @list = list
    @instructions = parse_instructions
  end

  private

  def parse_instructions
    list.split(LIST_SPLIT_PATTERN).filter_map do |instruction|
      dir = instruction.scan(ACCEPTED_DIRS_PATTERN).first
      next unless dir

      count = instruction.scan(COUNT_PATTERN).first
      next unless count

      [dir, count]
    end
  end
end
