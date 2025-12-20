# frozen_string_literal: true

require "spec_helper"
require "dial"

RSpec.describe Dial do
  specify "initial conditions" do
    dial = described_class.new
    expect(dial.pointing_at).to eq(50)
  end

  specify "turning the dial" do
    dial = described_class.new

    dial.turn(:l, 5)
    expect(dial.pointing_at).to eq(45)

    dial.turn(:r, 10)
    expect(dial.pointing_at).to eq(55)
  end

  specify "turning the dial around 0/99" do
    dial = described_class.new

    dial.turn(:l, 55)
    expect(dial.pointing_at).to eq(95)

    dial.turn(:r, 5)
    expect(dial.pointing_at).to eq(0)

    dial.turn(:r, 10)
    expect(dial.pointing_at).to eq(10)

    dial.turn(:l, 10)
    expect(dial.pointing_at).to eq(0)
  end

  specify "crazy high number" do
    dial = described_class.new

    dial.turn(:l, 876)
    expect(dial.pointing_at).to eq(74)
  end

  specify "turning the dial with invalid input" do
    dial = described_class.new

    expect {
      dial.turn("f", 5)
    }.to raise_error('unknown direction `F`, must be one of ["L", "R"]')
  end
end
