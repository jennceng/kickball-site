require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

TeamData::ROLL_CALL.each do |team_datum|
  team_name = team_datum[0]
  roster = team_datum[1]
  Team.new(team_name, roster)
end

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = Team.all

  erb :'teams/index'
end

get "/teams/:team_name" do
  @team = Team.all.find{|team| team.name.to_s == params[:team_name]}

  erb :'teams/show'
end

get "/positions" do
  @positions = Player.all.map(&:position).uniq

  erb :'positions/index'
end

get "/positions/:position" do
  @position = params[:position]
  @players_at_position = Player.all.select{|player| player.position.to_s == @position}

  erb :'positions/show'
end
