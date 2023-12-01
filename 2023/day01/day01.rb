# frozen_string_literal: true

# A CalibrationValue holds the raw_value (pqr3stu8vwx) and the integrer (38)

# A Trebuchet has a single CalibrationValue
# However, if given multiple CalibrationValue(s) it will sum their raw_values to have only one

require_relative "../../lib/aoc_helpers"

class CalibrationValue
  def initialize(raw_input)
    @raw_input = raw_input
  end

  def to_i
    @integrer ||= calculate_value if @raw_input.is_a? String
  end

  private

  def calculate_value
    @raw_input.gsub(/[^\d]/, "").chars.values_at(0, -1).join.to_i
  end
end

class Trebuchet
  attr_reader :calibrated_value

  def initialize(calibration_input)
    case calibration_input
    when CalibrationValue
      @calibrated_value = calibration_input.to_i
    when Array
      @calibrated_value = calibration_input.map(&:to_i).sum
    end
  end
end

input = load_input
calibration_values = input.split.map { |line| CalibrationValue.new(line) }

santa_trebuchet = Trebuchet.new(calibration_values)

p santa_trebuchet.calibrated_value
