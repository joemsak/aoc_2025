# frozen_string_literal: true

require "spec_helper"
require "dial"

RSpec.describe Dial do
  specify "initial conditions" do
    dial = described_class.new
    expect(dial.position).to eq(50)
  end

  specify "turn the dial" do
    dial = described_class.new

    dial.step("L")
    expect(dial.position).to eq(49)

    dial.step("R")
    expect(dial.position).to eq(50)
  end

  specify "wrap around 0/99" do
    dial = described_class.new

    51.times { dial.step("L") }
    expect(dial.position).to eq(99)

    dial.step("R")
    expect(dial.position).to eq(0)
  end
end
