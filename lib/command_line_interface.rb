def welcome
  puts "Welcome to Codenames!"
  puts "Your mission, should you choose to accept it, is to contact all our agents in the field before your opponent finds all of theirs. Agents can only be identified by their code names so the spy master will try to give you any information he can. Watch out for innocent bystanders, enemy spies, and the assasin."

end

def goodbye
  puts "Goodbye!"
end


#
# def get_guess_from_user
#   puts "please enter your guess as a word or coordinates"
#   gets.chomp.downcase
#
#
# end
#
# def get_words_from_user
#   puts "please enter 25 words seperated by commas"
#   array = gets.chomp.downcase
# end



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
      goodbye
    end
  end
end

def get_words_from_user
  puts "please enter 25 words seperated by commas"
  array = gets.chomp.downcase
end

def red_team_guess
  puts "Team Red, enter your guess:"
  gets.chomp.downcase
end

def blue_team_guess
  puts "Team Blue, enter your guess:"
  gets.chomp.downcase
end
# use this later
# while Color.count_team_blue>0 && Color.count_team_blue>0

def red_team_turn
  if Word.guessed_word_in_game(red_team_guess)
    case Word.find_by(word: red_team_guess).game_positions[0].color_id
    when 1
      puts "Correct"
    when 2
      puts "Incorrect"
    when 3
      puts "Grey"
    when 4
      puts "Game over!"
    end
  else
    puts "Incorrect input"
    red_team_turn
  end
end

def blue_team_turn
    case Word.find_by(word: blue_team_guess).game_positions[0].color_id
    when 1
      puts "Correct"
    when 2
      puts "Incorrect"
    when 3
      puts "Grey"
    when 4
      puts "Game over!"
    else
      puts "Incorrect input"
      blue_team_turn
    end
end

# def user_turns ##working
#   puts "Team Red, your clue is: "+Word.red_clue
#   input = Word.guessed_word_in_game(red_team_guess)
#   until input
#     puts "That is not a valid choice"
#     input = Word.guessed_word_in_game(red_team_guess)
#   end
#   Word.find_by(word: input).guess
#   Color.set_counter
#   display_board(GamePosition.formatted_words_array)
#
#   puts  "Team Blue, your clue is: "+Word.blue_clue
#   input = Word.guessed_word_in_game(blue_team_guess)
#   until input
#     puts "That is not a valid choice"
#     input = Word.guessed_word_in_game(blue_team_guess)
#   end
#   Word.find_by(word: input).guess
#   Color.set_counter
#   display_board(GamePosition.formatted_words_array)
# end


def user_turns(turn_counter) ##working

  if turn_counter.odd?
    puts "Team Red, your clue is: "+Word.red_clue
    input = Word.guessed_word_in_game(red_team_guess)
    until input
      puts "That is not a valid choice"
      input = Word.guessed_word_in_game(red_team_guess)
    end
    if input != "1"
      turn_counter = Word.find_by(word: input).guess(turn_counter)
      Color.set_counter
    elsif input == "1"
      turn_counter +=1
      puts "Team Red skipped their turn"
    end
    Color.read_score
    display_board(GamePosition.formatted_words_array)
    turn_counter
  elsif turn_counter.even?
    puts  "Team Blue, your clue is: "+Word.blue_clue
    input = Word.guessed_word_in_game(blue_team_guess)
    until input
      puts "That is not a valid choice"
      input = Word.guessed_word_in_game(blue_team_guess)
    end
    if input != "1"
      turn_counter = Word.find_by(word: input).guess(turn_counter)
      Color.set_counter
    elsif input == "1"
      turn_counter +=1
      puts "Team Blue skipped their turn"
    end
    Color.read_score
    display_board(GamePosition.formatted_words_array)
    turn_counter
  end
end


  # red_team_score = Color.count_team_red
  # blue_team_score = Color.count_team_blue
  # binding.pry
  # round = 1

  # while red_team_score > 0 && blue_team_score > 0
  #   red_team_turn(Word.find_by(word: red_team_guess).game_positions[0].color_id)
  #   # binding.pry
  #   # blue_input = Word.find_by(word: blue_team_guess).game_positions[0].color_id
  #   # blue_team_turn(blue_input)
  #   puts "Round #{round}!"
  #   # round += 1
  # end
# end

    # red_team_turn
    # blue_team_turn
  # end


# end



def display_board(board)
  puts "          1             2             3             4             5      "
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "A | #{board[0]} | #{board[1]} | #{board[2]} | #{board[3]} | #{board[4]} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "B | #{board[5]} | #{board[6]} | #{board[7]} | #{board[8]} | #{board[9]} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "C | #{board[10]} | #{board[11]} | #{board[12]} | #{board[13]} | #{board[14]} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "D | #{board[15]} | #{board[16]} | #{board[17]} | #{board[18]} | #{board[19]} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "E | #{board[20]} | #{board[21]} | #{board[22]} | #{board[23]} | #{board[24]} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"

end
