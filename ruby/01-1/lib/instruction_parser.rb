# frozen_string_literal: true

require_relative "direction"

class InstructionParser
  include Direction

  LIST_SPLIT_PATTERN = /[\n,]\s*/
  COUNT_PATTERN = /\d+/

  attr_reader :list, :instructions

  def initialize(list)
    @list = list
    @instructions = parse_instructions
  end

  private

  def parse_instructions
    list.split(LIST_SPLIT_PATTERN).filter_map do |instruction|
      dir = instruction[DIR_PATTERN, 1]
      count = instruction[COUNT_PATTERN]
      [dir, count] if dir && count
    end
  end
end
