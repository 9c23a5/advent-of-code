# frozen_string_literal: true

require_relative "../../lib/aoc_helpers"

class Game
  attr_reader :id, :red_played, :green_played, :blue_played
  def initialize(id, params)
    @id = id
    # Array of numbers played for each color...
    @red_played = params[:red]
    @green_played = params[:green]
    @blue_played = params[:blue]
  end

  def self.parse(string)
    params = {}

    %i[red green blue].each do |color|
      color_regex = /(\d+)\s#{color}/
      played_amounts = string.scan(color_regex).flatten.map(&:to_i)

      params[color] = played_amounts
    end

    game_id = string.match(/Game (\d+):/).captures.first.to_i

    Game.new(game_id, params)
  end

  def possible?(params)
    @red_played.max <= params[:red] &&
      @blue_played.max <= params[:blue] &&
      @green_played.max <= params[:green]
  end
end

input = load_input.split("\n")

all_games = input.map { |game_line|
  Game.parse(game_line)
}

# Part 1

my_maximum = {red: 12, green: 13, blue: 14}

result = all_games.select { |game|
  game.possible?(my_maximum)
}.map(&:id).sum

puts "Result for part 1: #{result}"
