def welcome
  puts "Welcome to Codenames!"
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
  while input != "1" && input != "2" && input != "q"
    puts "press 1 for EASY (seeded random words), press 2 for HARD (really random words). q to QUIT"
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
