require "spec_helper"
require "solver"

RSpec.describe Solver do
  it "returns the correct count when dial points at zero" do
    solver = Solver.new("L50")
    expect(solver.solve).to eq(1)

    solver = Solver.new("L50\nR1\nL1")
    expect(solver.solve).to eq(2)
  end
end
