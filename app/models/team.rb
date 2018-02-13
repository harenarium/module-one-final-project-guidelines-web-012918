class Team < ActiveRecord::Base
  has_many :game_positions
  has_many :words, through: :game_positions


  # 
  # def team.guess(word) ##cli gets this from user
  #   if word.game_positions.color.counter == 1
  #     winner(word.game_positions.color)
  #   else
  #     word.game_positions.color.counter -= 1
  #     team.switch()
  #   end
  # end
  #
  # def team.winner(team_color)
  #   puts "#{team_color} team wins!"
  # end
  #
  # def team.start
  #
  # end

end
