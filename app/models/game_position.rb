class GamePosition < ActiveRecord::Base
  belongs_to :word
  belongs_to :color

  def self.first_player
    [1,2].sample(1)[0]
  end

  def self.create_new_game
    self.destroy_all
    color_distribution = [1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,4] << first_player
    random_color = color_distribution.sample(25)

    Word.words_in_game.sample(25).each {|word|
      gp = GamePosition.new
      gp.word_id = word.id
      gp.guessed = false
      gp.color_id = random_color.pop
      gp.save
    }
  end

  def self.formatted_words_array
    self.all.map{ |gp|
      gp.format_color(gp.formatted_word, gp.color_id)
    }
  end

  # def self.colors_array ##
  #   self.all.color_id.pluck(:color)
  # end

  def formatted_word
    case self.word.word.length
    when 10
      "#{self.word.word} "
    when 9
      " #{self.word.word} "
    when 8
      " #{self.word.word}  "
    when 7
      "  #{self.word.word}  "
    when 6
      "  #{self.word.word}   "
    when 5
      "   #{self.word.word}   "
    when 4
      "   #{self.word.word}    "
    when 3
      "    #{self.word.word}    "
    when 2
      "    #{self.word.word}     "
    when 1
      "     #{self.word.word}     "
    else
      self.word.word[0...11]
    end
  end

  def format_color(word_string, color_id)
    if self.guessed
      case color_id
      when 1
        "\e[1m\e[37m\e[41m#{word_string}\e[0m\e[0m\e[22m"
      when 2
        "\e[1m\e[37m\e[44m#{word_string}\e[0m\e[0m\e[22m"
      when 3
        "\e[1m\e[47m#{word_string}\e[0m\e[22m"
      when 4
        "\e[1m\e[31m\e[40m#{word_string}\e[0m\e[0m\e[22m"
      end
    else
      word_string
    end
  end

end
