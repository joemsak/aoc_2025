require "instruction_parser"
require "dial"

class Solver
  attr_reader :input, :parser, :dial, :counter

  def initialize(input)
    @input = input
    @parser = InstructionParser.new(@input)
    @dial = Dial.new
    @counter = 0
  end

  def solve
    parser.instructions.each do |instruction|
      dial.turn(*instruction)
      @counter += 1 if dial.pointing_at.zero?
    end

    counter
  end
end
