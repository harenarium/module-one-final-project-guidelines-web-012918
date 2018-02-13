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
    clue = clues_hash[rand(0...clues_hash.count)]["word"].split(" ").first
    self.clue = clue
    self.save
    clue
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

  def self.guessed_word_in_game(guess) #returns found word or false?
    word_found = false
    GamePosition.where(guessed: false).map{ |gp|
      gp.word.word
    }.each{ |word|
      if word.downcase == guess.downcase
        word_found = true
        return word
      end
    }
      word_found #== false
end
