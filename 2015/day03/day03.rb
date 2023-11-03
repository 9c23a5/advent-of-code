# frozen_string_literal: true

input = File.read("input.txt")

STARTING_POSITION = [0, 0]

class Position
  attr_accessor :position_gifts

  def initialize(position_gifts)
    @x, @y = STARTING_POSITION
    @position_gifts = position_gifts
    give_gift
  end

  def move_up
    @y += 1
    give_gift
  end

  def move_down
    @y -= 1
    give_gift
  end

  def move_right
    @x += 1
    give_gift
  end

  def move_left
    @x -= 1
    give_gift
  end

  private

  def to_a
    [@x, @y]
  end

  def give_gift
    @position_gifts[to_a] += 1
  end
end

def parse_script(script, pointer)
  script.each { |char|
    case char[0]
    when "^"
      pointer.move_up
    when "v"
      pointer.move_down
    when ">"
      pointer.move_right
    when "<"
      pointer.move_left
    end
  }
end

position_gifts = Hash.new { |_, v| v = 0 }

santa_pointer = Position.new(position_gifts)
santa_script = input.chars.each.with_index(1).filter { |char, index| index.odd? }
parse_script(santa_script, santa_pointer)

robosanta_pointer = Position.new(santa_pointer.position_gifts)
robosanta_script = input.chars.each.with_index(1).filter { |char, index| index.even? }
parse_script(robosanta_script, robosanta_pointer)

p robosanta_pointer.position_gifts.count
