class Team < ActiveRecord::Base
  has_many :game_positions
  has_many :words, through: :game_positions
end
