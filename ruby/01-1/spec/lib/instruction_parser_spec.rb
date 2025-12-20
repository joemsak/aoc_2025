# frozen_string_literal: true

require "spec_helper"
require "instruction_parser"

RSpec.describe InstructionParser do
  specify "parsing a single instruction" do
    parser = described_class.new("L23")
    expect(parser.instructions).to eq([["L", "23"]])
  end

  specify "parsing multiple instructions" do
    parser = described_class.new("L23,R84, R32, L1")
    expect(parser.instructions).to eq([["L", "23"], ["R", "84"], ["R", "32"], ["L", "1"]])
  end

  specify "ignoring invalid instructions" do
    parser = described_class.new("L23,Fart2, R32,,W3,N1,L\#$")
    expect(parser.instructions).to eq([["L", "23"], ["R", "32"]])
  end

  specify "line break list" do
    parser = described_class.new("L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82")
    expect(parser.instructions).to eq([
      ["L", "68"],
      ["L", "30"],
      ["R", "48"],
      ["L", "5"],
      ["R", "60"],
      ["L", "55"],
      ["L", "1"],
      ["L", "99"],
      ["R", "14"],
      ["L", "82"]
    ])
  end
end
