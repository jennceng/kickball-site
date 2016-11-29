require_relative "./team_data"

class Player
  PLAYERS = []

  attr_reader :name, :position

  def initialize(name, position)
    @name = name
    @position = position
    PLAYERS << self
  end

  def self.all
    PLAYERS
  end
end
