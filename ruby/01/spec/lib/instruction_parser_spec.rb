# frozen_string_literal: true

require "spec_helper"
require "instruction_parser"

RSpec.describe InstructionParser do
  specify "parsing a single instruction" do
    parser = described_class.new("L23")
    expect(parser.instructions.map(&:rotation)).to eq(["L"])
    expect(parser.instructions.map(&:clicks)).to eq([23])
  end

  specify "parsing multiple instructions" do
    parser = described_class.new("L23,R84, R32, L1")
    expect(parser.instructions.map(&:rotation)).to eq(["L", "R", "R", "L"])
    expect(parser.instructions.map(&:clicks)).to eq([23, 84, 32, 1])
  end

  specify "ignoring invalid instructions" do
    parser = described_class.new("L23,Fart2, R32,,W3,N1,L\#$")
    expect(parser.instructions.map(&:rotation)).to eq(["L", "R"])
    expect(parser.instructions.map(&:clicks)).to eq([23, 32])
  end

  specify "line break list" do
    parser = described_class.new("L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82")
    expect(parser.instructions.map(&:rotation)).to eq(%w[L L R L R L L L R L])
    expect(parser.instructions.map(&:clicks)).to eq([68, 30, 48, 5, 60, 55, 1, 99, 14, 82])
  end
end
