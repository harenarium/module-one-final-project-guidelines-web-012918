def welcome
  puts "Welcome to Codenames!"
end


def get_guess_from_user
  puts "please enter your guess as a word or coordinates"
  gets.chomp.downcase


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

def user_turns
  red_team_score = Color.count_team_red
  blue_team_score = Color.count_team_blue
  # binding.pry
  # round = 1
  while red_team_score > 0 && blue_team_score > 0
    red_team_turn(Word.find_by(word: red_team_guess).game_positions[0].color_id)
  #   # binding.pry
  #   # blue_input = Word.find_by(word: blue_team_guess).game_positions[0].color_id
  #   # blue_team_turn(blue_input)
  #   puts "Round #{round}!"
  #   # round += 1
  end
end

def red_team_turn(input)
  if input == 1
    red_team_score -= 1
    puts "Correct"
  elsif input == 2
    blue_team_score -= 1
    puts "That was a blue team Code"
  elsif input == 3
    puts "Grey code, next turn."
  elsif input == 4
    red_team_score = 0
    puts "Game over!"
  end
end

def blue_team_turn(input)
  if input == 1
    blue_team_score -= 1
    puts "Correct"
  elsif input == 2
    red_team_score -= 1
    puts "That was a red team Code"
  elsif input == 3
    puts "Grey code, next turn."
  elsif input == 4
    blue_team_score = 0
    puts "Game over!"
  end
end

def format_color(word)
  if word.guessed
    case word.color
    when "red"
      "\e[41m#{word}\e[0m"
    when "blue"
      "\e[44m#{word}\e[0m"
    when "gray"
      "\e[47m#{word}\e[0m"
    when "black"
      "\e[40m#{word}\e[0m"
    end
  # else
    #no format
  end
end


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
