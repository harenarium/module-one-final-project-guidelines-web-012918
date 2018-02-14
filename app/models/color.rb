class Color < ActiveRecord::Base
  has_many :game_positions
  has_many :words, through: :game_positions

  def self.count_team_red
    # red = GamePosition.where(color_id: 1, guessed = false).count
    red = Color.find(1)
    red.counter = GamePosition.where(color_id: 1, guessed: false).count
    red.save
    red.counter
  end

  def self.count_team_blue
    # blue = GamePosition.where(color_id: 2, guessed = false).count
    blue = Color.find(2)
    blue.counter = GamePosition.where(color_id: 2, guessed: false).count
    blue.save
    blue.counter
  end

  def self.set_counter
    count_team_red
    count_team_blue
  end

  def self.read_score
    puts "\e[31mTeam Red\e[0m has #{self.count_team_red} agent(s) left. \e[34mTeam Blue\e[0m has #{self.count_team_blue} agent(s) left."
  end

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
