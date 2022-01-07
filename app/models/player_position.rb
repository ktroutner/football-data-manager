# frozen_string_literal: true

# Value object for player position
class PlayerPosition
  attr_reader :position

  VALUES = { goalkeeper: 1, defense: 2, midfield: 3, forward: 4 }.freeze

  def initialize(position)
    @position = position
  end
end
