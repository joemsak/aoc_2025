require "spec_helper"
require "solver"

RSpec.describe Solver do
  specify "simple example" do
    solver = described_class.new("L50") # Land
    expect(solver.solve).to eq(1)

    solver = described_class.new("L51\nR1") # Pass, Land
    expect(solver.solve).to eq(2)

    solver = described_class.new("L51\nR2\nL1") # Pass, Pass, Land
    expect(solver.solve).to eq(3)
  end

  specify "edge case num: 1000" do
    solver = described_class.new("L1000") # Pass 10
    expect(solver.solve).to eq(10)
  end

  specify "edge case num: 2000" do
    solver = described_class.new("R2000") # Pass 20
    expect(solver.solve).to eq(20)
  end

  specify "edge case num: 1000, 2000" do
    solver = described_class.new("L1000\nR2000") # Pass 10, Pass 20
    expect(solver.solve).to eq(30)
  end

  specify "edge case num: 1000, 2000, 200" do
    solver = described_class.new("L1000\nR2000\nL200") # Pass 10, Pass 20, Pass 2
    expect(solver.solve).to eq(32)
  end

  specify "edge case num: 1000, 2000, 200, 150" do
    solver = described_class.new("L1000\nR2000\nL200\nR150") # Pass 10, Pass 20, Pass 2, Pass 1, Land 1
    expect(solver.solve).to eq(34)
  end

  specify "given example" do
    solver = described_class.new("L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82")
    expect(solver.solve).to eq(6)
  end
end
