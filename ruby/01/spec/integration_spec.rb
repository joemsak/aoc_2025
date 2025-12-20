# frozen_string_literal: true

require "spec_helper"
require "dial"
require "instruction_parser"

RSpec.describe "integration" do
  specify do
    dial = Dial.new
    input = "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"
    parser = InstructionParser.new(input)

    parser.instructions.each do |instruction|
      instruction.clicks.times do
        dial.step(instruction.rotation)
      end
    end

    expect(dial.position).to eq(32)
  end
end
