class InstructionParser
  attr_reader :instructions

  Instruction = Struct.new(:rotation, :clicks)

  def initialize(list)
    @instructions = parse(list)
  end

  private

  def parse(list)
    list.split(/[\n,]\s*/).filter_map do |entry|
      rotation = entry[/\A\s*(?:L|R)/i]
      clicks = entry[/\d+\z/]

      next unless rotation && clicks

      Instruction.new(rotation.strip.upcase, clicks.to_i)
    end
  end
end
