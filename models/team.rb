require_relative "./team_data"
require_relative "./player"

class Team
  TEAMS = []
  attr_accessor :name, :roster, :players

  def initialize(name, roster)
    @name = name
    @roster = roster
    @players = []
    create_players
    TEAMS << self
  end

  def create_players
    @roster.each do |position, name|
      @players << Player.new(name, position)
    end
  end

  def self.all
    TEAMS
  end
end
