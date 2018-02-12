class Word < ActiveRecord::Base
  has_many :game_positions
  has_many :teams, through: :game_positions
end
