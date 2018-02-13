class GamePosition < ActiveRecord::Base
  belongs_to :word
  belongs_to :team

  def self.create_new_game
    #drop the previous table in db
    first_color = [1,2].sample(1)
    color_distribution = [1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,4] << first_color[0]
    random_color = color_distribution.sample(25)
    Word.words_in_game.each {|word|
      gp = GamePosition.new
      gp.word_id = word.id
      gp.guessed = false
      gp.color_id = random_color.pop
      gp.save
    }
  end

  def self.words_array
    self.all.map{ |gp|
      gp.word.word
    }
  end

  def self.colors_array ##
    self.all.color_id.pluck(:color)
  end

end
