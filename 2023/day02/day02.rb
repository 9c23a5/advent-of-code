# frozen_string_literal: true

require_relative "../../lib/aoc_helpers"

class Game
  attr_reader :id, :max_red, :max_green, :max_blue
  def initialize(id, params)
    @id = id
    @max_red = params[:red]
    @max_green = params[:green]
    @max_blue = params[:blue]
  end

  def self.parse(string)
    params = {}

    %i[red green blue].each do |color|
      color_regex = /(\d+)\s#{color}/
      amount = string.scan(color_regex).flatten.map(&:to_i).max

      params[color] = amount
    end

    game_id = string.match(/Game (\d+):/).captures.first.to_i

    Game.new(game_id, params)
  end

  def possible?(params)
    @max_red <= params[:red] &&
      @max_blue <= params[:blue] &&
      @max_green <= params[:green]
  end
end

input = load_input.split("\n")

all_games = input.map { |game_line|
  Game.parse(game_line)
}

# Part 1

result = all_games.select { |game|
  game.possible?({red: 12, green: 13, blue: 14})
}.map(&:id).sum

puts "Result for part 1: #{result}"
