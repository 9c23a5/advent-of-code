# frozen_string_literal: true

require_relative "../../2023/day01/day01"

RSpec.describe Trebuchet do
  subject { described_class.from_calibration_document(calibration_values) }

  let(:calibration_values) {
    <<~INPUT
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    INPUT
  }

  it "calibrates itself" do
    expect(subject.calibrated_value).to eq(142)
  end
end
