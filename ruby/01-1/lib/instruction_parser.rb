# frozen_string_literal: true

require_relative "dial"

class InstructionParser
  LIST_SPLIT_PATTERN = /(?:\n|,)\s?/
  COUNT_PATTERN = /\d+\z/

  attr_reader :list, :instructions

  def initialize(list)
    @list = list
    @instructions = parse_instructions
  end

  private

  def parse_instructions
    list.split(LIST_SPLIT_PATTERN).filter_map do |instruction|
      dir = instruction.scan(Dial::DIR_PATTERN).first
      next unless dir

      count = instruction.scan(COUNT_PATTERN).first
      next unless count

      [dir, count]
    end
  end
end
