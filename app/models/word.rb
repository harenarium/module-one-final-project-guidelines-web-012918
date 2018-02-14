require 'rest-client'
require 'json'
require 'pry'

class Word < ActiveRecord::Base
  has_many :game_positions
  has_many :teams, through: :game_positions

  # generate 25 words
  # words.sample(25)

  def word_clue
    url = "https://api.datamuse.com/words?rel_syn=#{self.word}" #gets the clue
    all_clues = RestClient.get(url)
    clues_hash = JSON.parse(all_clues)
    if clues_hash.empty?
      url = "https://api.datamuse.com/words?rel_trg=#{self.word}" #gets the clue
      all_clues = RestClient.get(url)
      clues_hash = JSON.parse(all_clues)
      if clues_hash.empty?
        return "This word has no synonym"
      end
      return clue = clues_hash[rand(0...clues_hash.count)]["word"].split(" ").first + "."
    end
    clue = clues_hash[rand(0...clues_hash.count)]["word"].split(" ").first
    # if clue ==self.word
    #   clue = self.word_clue
    # end
  end

  def self.random_arr_of_words
    url = "http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=true&minCorpusCount=0&minLength=5&maxLength=9&limit=25&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
    all_random_words = RestClient.get(url)
    random_words = JSON.parse(all_random_words)
    random_words.each do |hash|
      found_word = self.find_or_create_by(word: hash["word"])
      found_word.in_game = true
      found_word.save
    end
  end

  def self.random_words_from_seed
    random_ids=(1..self.count).to_a.sample(25)
    random_ids.each{|num|
      word = self.find(num)
      word.in_game = true
      word.save
    }
  end

  def self.words_in_game #=> arr of obj in game
    self.where(in_game: true)
  end

  def self.reset_words
    self.update_all "in_game = 'false'"
  end

  def guess(turn_counter)
    self.game_positions[0].update(guessed: true)
    if self.game_positions[0].color_id == 4 #black color
      puts "That was the Assasin Card! Game over!"
      return turn_counter
    elsif self.game_positions[0].color_id == 3 #grey color
      puts "That was an innocent bystander. Your turn ends."
      return turn_counter +=1
    elsif self.game_positions[0].color_id%2 == turn_counter%2 #same color
      puts "You got it! Keep going!"
      return turn_counter
    elsif self.game_positions[0].color_id%2 != turn_counter%2 #dif color
      puts "Oh no! That was the other team's card! Your turn ends and they get a point."
      return turn_counter +=1
    end
  end

  def self.guessed_word_in_game(guess) #returns found word or false?
    word_found = false
    GamePosition.where(guessed: false).map{ |gp|
      gp.word.word
    }.each{ |word|
      if word.downcase == guess.downcase
        word_found = true
        return word
      elsif guess == "1"
        return "1"
      end
    }
    word_found #== false
  end

  def self.red_clue
    GamePosition.red_unguessed_words.sample.word.word_clue
  end

  def self.blue_clue
    GamePosition.blue_unguessed_words.sample.word.word_clue
  end

end
