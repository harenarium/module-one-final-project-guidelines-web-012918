class GamePosition < ActiveRecord::Base
  belongs_to :words
  belongs_to :teams

  
end
