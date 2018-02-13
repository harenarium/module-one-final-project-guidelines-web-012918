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
