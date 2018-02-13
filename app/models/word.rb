require 'rest-client'
require 'json'
require 'pry'

class Word < ActiveRecord::Base
  has_many :game_positions
  has_many :teams, through: :game_positions

  generate 25 words
  words.sample(25)

  def word_clue(word)
    url = "https://api.datamuse.com/words?rel_syn=#{word}" #gets the clue
    all_clues = RestClient.get(url)
    clues_hash = JSON.parse(all_clues)
    clues_hash[rand(0...clues_hash.count)]["word"].split(" ").first
  end

  def random_arr_of_words
    arr = []
    url = "http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=true&minCorpusCount=0&minLength=5&maxLength=9&limit=25&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
    all_random_words = RestClient.get(url)
    random_words = JSON.parse(all_random_words)
    random_words.each do |hash|
      arr << hash["word"]
    end
    arr
  end

end
