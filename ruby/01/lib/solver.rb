require_relative "./instruction_parser"
require_relative "./dial"

class Solver
  attr_reader :instructions

  def initialize(list)
    @instructions = InstructionParser.new(list).instructions
    @dial = Dial.new
    @zero_passes = 0
    @zero_landings = 0
  end

  def solve
    instructions.each do |instruction|
      turn_dial(instruction.rotation, instruction.clicks)
    end

    zero_passes + zero_landings
  end

  private

  attr_reader :dial, :zero_passes, :zero_landings

  def turn_dial(rotation, clicks)
    while clicks > 0 do
      dial.step(rotation)
      clicks -= 1
      @zero_passes += 1 if clicks > 0 && dial.position.zero?
    end

    @zero_landings += 1 if dial.position.zero?
  end
end
