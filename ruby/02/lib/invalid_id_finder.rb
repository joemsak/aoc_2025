class InvalidIdFinder
  def initialize(input)
    @input = input
  end

  def invalid_ids
    candidates.filter_map do |candidate|
      next unless candidate.length > 1

      right_idx = candidate.length / 2
      next unless candidate[0..right_idx - 1] == candidate[right_idx..-1]

      candidate.to_i
    end
  end

  private

  def candidates
    @input.split(",").flat_map do |range|
      bounds = range.split("-").map(&:to_i)
      (bounds[0]..bounds[1]).to_a.map(&:to_s)
    end
  end
end
