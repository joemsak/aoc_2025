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

    dial.turn("L", 5)
    expect(dial.position).to eq(45)

    dial.turn("R", 10)
    expect(dial.position).to eq(55)
  end

  specify "wrap around 0/99" do
    dial = described_class.new

    dial.turn("L", 55)
    expect(dial.position).to eq(95)

    dial.turn("R", 5)
    expect(dial.position).to eq(0)

    dial.turn("L", 1)
    expect(dial.position).to eq(99)
  end

  specify "keep count of landing on 0" do
    dial = described_class.new

    dial.turn("L", 50) # 0
    expect(dial.zero_landings).to eq(1)

    dial.turn("R", 1) # 1
    dial.turn("L", 2) # 99
    dial.turn("R", 1) # 0
    expect(dial.zero_landings).to eq(2)
  end

  specify "keep count of passing 0" do
    dial = described_class.new

    dial.turn("L", 51) # 99
    expect(dial.zero_passes).to eq(1)

    dial.turn("R", 1) # 0
    dial.turn("R", 1) # 1
    dial.turn("L", 2) # 99
    expect(dial.zero_passes).to eq(2)

    dial.turn("L", 200) # 99 twice
    expect(dial.zero_passes).to eq(4)

    dial.turn("R", 1_000) # 99 ten times
    expect(dial.zero_passes).to eq(14)
  end

  specify "turning after landing on 0 doesn't double count as a pass" do
    dial = described_class.new

    dial.turn("L", 50) # 0
    dial.turn("R", 1) # 1
    expect(dial.zero_landings).to eq(1)
    expect(dial.zero_passes).to eq(0)

    dial.turn("L", 2) # 99
    expect(dial.zero_landings).to eq(1)
    expect(dial.zero_passes).to eq(1)
  end

  specify "edge case: high number" do
    dial = described_class.new

    dial.turn("L", 876)
    expect(dial.position).to eq(74)
  end
end
