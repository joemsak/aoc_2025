# frozen_string_literal: true

require "spec_helper"
require "dial"
require "instruction_parser"

RSpec.describe "integration" do
  specify do
    dial = Dial.new
    instructions = "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"

    InstructionParser.new(instructions).instructions.each do |instruction|
      dial.turn(*instruction)
    end

    expect(dial.pointing_at).to eq(32)
  end
end
