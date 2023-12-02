# frozen_string_literal: true

require_relative "../../2023/day02/day02"

RSpec.describe Game do
  let(:maximum_possible_blocks) {
    {
      red: 12,
      green: 13,
      blue: 14
    }
  }

  context "unit test" do
    subject { described_class.parse(game_line) }

    context "single possible game" do
      let(:game_line) {
        "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      }

      it "gets the correct maximum blocks possible" do
        expect(subject.red_played.max).to eq 4
        expect(subject.green_played.max).to eq 2
        expect(subject.blue_played.max).to eq 6
      end

      it "parses game id" do
        expect(subject.id).to eq 1
      end

      it "returns true for possible game" do
        expect(
          subject.possible?(maximum_possible_blocks)
        ).to be true
      end
    end

    context "single impossible game" do
      let(:game_line) {
        "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      }

      it "gets the correct maximum blocks possible" do
        expect(subject.red_played.max).to eq 20
        expect(subject.green_played.max).to eq 13
        expect(subject.blue_played.max).to eq 6
      end

      it "parses game id" do
        expect(subject.id).to eq 3
      end

      it "returns false for possible game" do
        expect(
          subject.possible?(maximum_possible_blocks)
        ).to be false
      end
    end
  end

  context "integration test" do
    subject {
      puzzle_input.split("\n").map { |game_line|
        described_class.parse(game_line)
      }
    }

    let(:puzzle_input) {
      <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT
    }

    it "sums ids of only possible games" do
      expect(
        subject.select { |game|
          game.possible?(maximum_possible_blocks)
        }.map(&:id).sum
      ).to eq 8
    end
  end
end
