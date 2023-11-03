# frozen_string_literal: true

input = File.read("input.txt")

class Dimensions
  def initialize(input)
    @l, @h, @w = parse_dimensions(input)
  end

  def surface_area
    2 * @l * @w + 2 * @w * @h + 2 * @h * @l
  end

  def smallest_side_area
    smallest_side(2).inject(:*)
  end

  def ribbon_length_for_wrapping
    sides = smallest_side(2)
    2 * (sides[0] + sides[1])
  end

  def ribbon_length_for_bow
    @l * @h * @w
  end

  private

  def parse_dimensions(dims_in_string)
    return unless dims_in_string.is_a?(String)
    dims_in_string.split("x").map(&:to_i)
  end

  def smallest_side(count)
    [@l, @h, @w].sort.take(count)
  end
end

all_boxes = input.map { Dimensions.new(_1) }

total_paper = all_boxes.inject(0) do |acc, box|
  acc + box.surface_area + box.smallest_side_area
end

total_ribbon = all_boxes.inject(0) do |acc, box|
  acc + box.ribbon_length_for_wrapping + box.ribbon_length_for_bow
end

p "Part 1: #{total_paper}"
p "Part 2: #{total_ribbon}"
