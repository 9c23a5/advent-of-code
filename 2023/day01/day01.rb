# frozen_string_literal: true

# A CalibrationValue holds the raw_value (pqr3stu8vwx) and the integrer (38)

# A Trebuchet has a single CalibrationValue
# However, if given multiple CalibrationValue(s) it will sum their raw_values to have only one

require_relative "../../lib/aoc_helpers"

class CalibrationValue
  WORDS_AS_NUMBERS = {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  def initialize(raw_input, words_as_int_flag: false)
    @raw_input = raw_input
    @parse_words = words_as_int_flag
  end

  def to_i
    @integrer ||= calculate_value if @raw_input.is_a? String
  end

  private

  def calculate_value
    matching_regex = if @parse_words
      /(?=(#{WORDS_AS_NUMBERS.keys.join("|")}|\d))/
    else
      /\d/
    end

    matches = @raw_input.scan(matching_regex)

    matches.flatten.map { |match| WORDS_AS_NUMBERS[match] || match }.values_at(0, -1).join.to_i
  end
end

class Trebuchet
  attr_reader :calibrated_value

  def initialize(calibration_input)
    case calibration_input
    when CalibrationValue
      @calibrated_value = calibration_input.to_i
    when Array
      if calibration_input.all? { |item| item.is_a?(CalibrationValue) }
        @calibrated_value = calibration_input.map(&:to_i).sum
      end
    end
  end
end

input = load_input

# Part 1

calibration_values = input.split.map { |line| CalibrationValue.new(line) }
trebuchet = Trebuchet.new(calibration_values)
p "Solution for Part 1: #{trebuchet.calibrated_value}"

correct_calculate_values = input.split.map { |line| CalibrationValue.new(line, words_as_int_flag: true) }
correct_trebuchet = Trebuchet.new(correct_calculate_values)
p "Solution for Part 2: #{correct_trebuchet.calibrated_value}"
