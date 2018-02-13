def welcome
  puts "Welcome to Codenames!"
end


# def get_guess_from_user
#   puts "please enter your guess as a word or coordinates"
#   gets.chomp.downcase
#
#
# end

####d
def get_guess_from_user_red
  puts "Team Red, enter your guess:"
  gets.chomp.downcase
end

def get_guess_from_user_blue
  puts "Team Blue, enter your guess:"
  gets.chomp.downcase
end

# def each_turn
#   r = Color.count_team_red
#   b = Color.count_team_blue
#   while r > 0 || b > 0
#     if
#   end
# end

####d

def get_words_from_user
  puts "please enter 25 words seperated by commas"
  array = gets.chomp.downcase
end

def format_word(word)
  case word.length
  when 10
    "#{word} "
  when 9
    " #{word} "
  when 8
    " #{word}  "
  when 7
    "  #{word}  "
  when 6
    "  #{word}   "
  when 5
    "   #{word}   "
  when 4
    "   #{word}    "
  when 3
    "    #{word}    "
  when 2
    "    #{word}     "
  when 1
    "     #{word}     "
  else
    word[0...11]
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
  puts "A | #{format_word(board[0])} | #{format_word(board[1])} | #{format_word(board[2])} | #{format_word(board[3])} | #{format_word(board[4])} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "B | #{format_word(board[5])} | #{format_word(board[6])} | #{format_word(board[7])} | #{format_word(board[8])} | #{format_word(board[9])} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "C | #{format_word(board[10])} | #{format_word(board[11])} | #{format_word(board[12])} | #{format_word(board[13])} | #{format_word(board[14])} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "D | #{format_word(board[15])} | #{format_word(board[16])} | #{format_word(board[17])} | #{format_word(board[18])} | #{format_word(board[19])} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"
  puts "  |             |             |             |             |             |"
  puts "E | #{format_word(board[20])} | #{format_word(board[21])} | #{format_word(board[22])} | #{format_word(board[23])} | #{format_word(board[24])} |"
  puts "  |             |             |             |             |             |"
  puts "  -----------------------------------------------------------------------"

end
