class Color < ActiveRecord::Base
  has_many :game_positions
  has_many :words, through: :game_positions


  #
  # def color.guess(word) ##cli gets this from user
  #   if word.game_positions.color.counter == 1
  #     winner(word.game_positions.color)
  #   else
  #     word.game_positions.color.counter -= 1
  #     color.switch()
  #   end
  # end
  #
  # def color.winner(color_color)
  #   puts "#{color_color} color wins!"
  # end
  #
  # def color.start
  #
  # end

end
