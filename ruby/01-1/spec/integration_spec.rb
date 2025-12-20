# frozen_string_literal: true

require "spec_helper"
require "dial"
require "instruction_parser"

RSpec.describe "integration" do
  specify do
    dial = Dial.new

    InstructionParser.new("L35,R42").instructions.each do |instruction|
      dial.turn(*instruction)
    end

    expect(dial.pointing_at).to eq(43)
  end
end
