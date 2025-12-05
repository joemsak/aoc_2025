require "spec_helper"
require "solver"

RSpec.describe Solver do
  it "returns the correct count when dial points at or passes zero" do
    solver = described_class.new("L50")
    expect(solver.solve).to eq(1)

    solver = described_class.new("L51\nR2\nL2")
    expect(solver.solve).to eq(2)
  end
end
