require "spec_helper"
require "invalid_id_finder"

RSpec.describe InvalidIdFinder do
  specify "11-22" do
    finder = described_class.new("11-22\n")
    expect(finder.invalid_ids).to eq([11, 22])
  end

  specify "95-115" do
    finder = described_class.new("95-115")
    expect(finder.invalid_ids).to eq([99])
  end

  specify "998-1012,1188511880-1188511890" do
    finder = described_class.new("998-1012,1188511880-1188511890")
    expect(finder.invalid_ids).to eq([1010, 11885_11885])
  end

  specify "222220-222224" do
    finder = described_class.new("222220-222224")
    expect(finder.invalid_ids).to eq([222_222])
  end


  specify "1698522-1698528" do
    finder = described_class.new("1698522-1698528")
    expect(finder.invalid_ids).to eq([])
  end

  specify "446443-446449" do
    finder = described_class.new("446443-446449")
    expect(finder.invalid_ids).to eq([446_446])
  end

  specify "38593856-38593862" do
    finder = described_class.new("38593856-38593862")
    expect(finder.invalid_ids).to eq([3859_3859])
  end

  specify "1-2" do
    finder = described_class.new("1-2")
    expect(finder.invalid_ids).to eq([])
  end
end
