# frozen_string_literal: true

require_relative "../../2023/day01/day01"

RSpec.describe Trebuchet do
  subject { described_class.new(calibration_values) }

  let(:puzzle_input) {
    <<~INPUT
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    INPUT
  }

  let(:calibration_values) {
    puzzle_input.split.map { |line| CalibrationValue.new(line) }
  }

  it "calibrates from calibration values" do
    expect(subject.calibrated_value).to eq(142)
  end
end

RSpec.describe CalibrationValue do
  subject { described_class.new(sample_line) }

  shared_examples_for "a correct calibration" do |result|
    it "calculates the correct calibration value" do
      expect(subject.to_i).to eq(result)
    end
  end

  context "two ints in raw_value" do
    let(:sample_line) { "1abc2" }

    it_behaves_like "a correct calibration", 12
  end

  context "one int in raw_value" do
    let(:sample_line) { "treb7uchet" }

    it_behaves_like "a correct calibration", 77
  end

  context "more than two ints in raw_value" do
    let(:sample_line) { "a1b2c3d4e5f" }

    it_behaves_like "a correct calibration", 15
  end
end
