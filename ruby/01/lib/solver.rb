require "instruction_parser"
require "dial"

class Solver
  attr_reader :input, :parser, :dial

  def initialize(input)
    @input = input
    @parser = InstructionParser.new(@input)
    @dial = Dial.new
  end

  def solve
    parser.instructions.each do |instruction|
      dial.turn(*instruction)
    end

    dial.zero_passes + dial.zero_landings
  end
end
