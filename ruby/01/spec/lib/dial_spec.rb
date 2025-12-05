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

    dial.turn(:l, 5)
    expect(dial.position).to eq(45)

    dial.turn(:r, 10)
    expect(dial.position).to eq(55)
  end

  specify "wrap around 0/99" do
    dial = described_class.new

    dial.turn(:l, 55)
    expect(dial.position).to eq(95)

    dial.turn(:r, 5)
    expect(dial.position).to eq(0)

    dial.turn(:l, 1)
    expect(dial.position).to eq(99)
  end

  specify "keep count of landing on 0" do
    dial = described_class.new

    dial.turn(:l, 50) # 0
    expect(dial.zero_landings).to eq(1)

    dial.turn(:r, 1) # 1
    dial.turn(:l, 2) # 99
    dial.turn(:r, 1) # 0
    expect(dial.zero_landings).to eq(2)
  end

  specify "keep count of passing 0" do
    dial = described_class.new

    dial.turn(:l, 51) # 99
    expect(dial.zero_passes).to eq(1)

    dial.turn(:r, 1) # 0
    dial.turn(:r, 1) # 1
    dial.turn(:l, 2) # 99
    expect(dial.zero_passes).to eq(2)

    dial.turn(:l, 200) # 99 twice
    expect(dial.zero_passes).to eq(4)
  end

  specify "edge case: high number" do
    dial = described_class.new

    dial.turn(:l, 876)
    expect(dial.position).to eq(74)
  end

  specify "edge case: invalid input" do
    dial = described_class.new

    expect {
      dial.turn("f", 5)
    }.to raise_error('unknown direction `F`, must be one of ["L", "R"]')
  end
end
