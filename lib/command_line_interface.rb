def welcome
  puts "Welcome to Codenames!"
  # puts "Your mission, should you choose to accept it, is to extract all our agents from the field before your opponent extracts all of theirs. Agents can only be identified by their code names so the spy master will try to give you any information he can. Watch out for innocent bystanders, enemy spies, and the assasin."
  print "1 "
  print "2 "
  system("say Your mission. should you choose to accept it, is to make contact with all of our agents in the field before your opponent contacts all of theirs. You are passing on vital information that we don’t want in enemy hand. Available to you are the locations of 25 persons of interest identified only by their code names. Among them stand your fellow agents, enemy spies, and random civilians. Oh, and there’s an assassin. The enemy is monitoring our communication lines so communication will be limited but the spy master will send you what information we can. Be aware, the enemy may try to feed false information to your team. As always, should any member of your team be caught or killed, the secretary will disavow any knowledge of your actions. Good luck!")
end

def goodbye
  ClearPage.clear
  puts "Goodbye!"
end


def select_words
  input = ""
  while input != "1" && input != "2" #&& input != "q"
    puts "press 1 for EASY (seeded random words), press 2 for HARD (really random words)." #q to QUIT
    input = gets.chomp
    if input == "1"
      Word.random_words_from_seed
    elsif input == "2"
      Word.random_arr_of_words
    elsif input == "q"
      ClearPage.clear
      goodbye
    end
  end
end

def get_words_from_user
  puts "please enter 25 words seperated by commas"
  array = gets.chomp.downcase
end

def red_team_guess
  puts "\e[31mTeam Red\e[0m, enter your guess:"
  gets.chomp.downcase
end

def blue_team_guess
  puts "\e[34mTeam Blue\e[0m, enter your guess:"
  gets.chomp.downcase
end
# use this later
# while Color.count_team_blue>0 && Color.count_team_blue>0

def computer_turn(turn_counter)
  if turn_counter.odd? #red turn
    begin
      clue = Word.red_clue
    rescue => e
      e.response
    end
    number = 1
    # clue = Word.red_clue
    puts "\e[31mTeam Red\e[0m, your clue is: "+clue+ ", " + number.to_s

  elsif turn_counter.even? #blue turn
    # clue = Word.blue_clue
    begin
      clue = Word.blue_clue
    rescue => e
      e.response
    end
    number = 1
    puts "\e[34mTeam Blue\e[0m, your clue is: "+clue+ ", " + number.to_s
  end
  number
end

def user_turns(turn_counter) ##working

  if turn_counter.odd?
    # puts "Team Red, your clue is: "+Word.red_clue
    input = Word.guessed_word_in_game(red_team_guess)
    until input
      puts "That is not a valid choice"
      input = Word.guessed_word_in_game(red_team_guess)
    end
    if input != "1"
      guess_output = Word.find_by(word: input).guess(turn_counter)
      turn_counter = guess_output[0]
      message = guess_output[1]
      Color.set_counter
    elsif input == "1"
      turn_counter +=1
      message = "\e[31mTeam Red\e[0m skipped their turn"
    end
      ClearPage.clear #2
    display_board(GamePosition.formatted_words_array) #3
    puts message
    Color.read_score #1
    turn_counter #4
  elsif turn_counter.even?
    # puts  "Team Blue, your clue is: "+Word.blue_clue
    input = Word.guessed_word_in_game(blue_team_guess)
    until input
      puts "That is not a valid choice"
      input = Word.guessed_word_in_game(blue_team_guess)
    end
    if input != "1"
      guess_output = Word.find_by(word: input).guess(turn_counter)
      turn_counter = guess_output[0]
      message = guess_output[1]
      Color.set_counter
    elsif input == "1"
      turn_counter +=1
      message =  "\e[34mTeam Blue\e[0m skipped their turn"
    end
    ClearPage.clear
    display_board(GamePosition.formatted_words_array)
    puts message
    Color.read_score
    turn_counter
  end
end

def who_won(turn_counter)
  if GamePosition.black_card_guessed
    puts turn_counter%2 == 1 ? "\e[31mTeam Red\e[0m, you lose!" : "\e[34mTeam Blue\e[0m, you lose!"
  elsif Color.count_team_red ==0
    puts "\e[31mTeam Red\e[0m, you win!"
  elsif Color.count_team_blue == 0
    puts "\e[34mTeam Blue\e[0m, you win!"
  end
end

def display_board(board)
  puts "          1             2             3             4             5      "
  puts "  +-------------+-------------+-------------+-------------+-------------+"
  puts "  |             |             |             |             |             |"
  puts "A | #{board[0]} | #{board[1]} | #{board[2]} | #{board[3]} | #{board[4]} |"
  puts "  |             |             |             |             |             |"
  puts "  +-------------+-------------+-------------+-------------+-------------+"
  puts "  |             |             |             |             |             |"
  puts "B | #{board[5]} | #{board[6]} | #{board[7]} | #{board[8]} | #{board[9]} |"
  puts "  |             |             |             |             |             |"
  puts "  +-------------+-------------+-------------+-------------+-------------+"
  puts "  |             |             |             |             |             |"
  puts "C | #{board[10]} | #{board[11]} | #{board[12]} | #{board[13]} | #{board[14]} |"
  puts "  |             |             |             |             |             |"
  puts "  +-------------+-------------+-------------+-------------+-------------+"
  puts "  |             |             |             |             |             |"
  puts "D | #{board[15]} | #{board[16]} | #{board[17]} | #{board[18]} | #{board[19]} |"
  puts "  |             |             |             |             |             |"
  puts "  +-------------+-------------+-------------+-------------+-------------+"
  puts "  |             |             |             |             |             |"
  puts "E | #{board[20]} | #{board[21]} | #{board[22]} | #{board[23]} | #{board[24]} |"
  puts "  |             |             |             |             |             |"
  puts "  +-------------+-------------+-------------+-------------+-------------+"

end
