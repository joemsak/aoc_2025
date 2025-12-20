require_relative "./instruction_parser"
require_relative "./dial"

class Solver
  def initialize(list)
    @instructions = InstructionParser.new(list).instructions
    @dial = Dial.new
  end

  def solve
    @instructions.each do |instruction|
      @dial.turn(instruction.rotation, instruction.clicks)
    end

    @dial.zero_passes + @dial.zero_landings
  end
end
