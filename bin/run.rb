require_relative '../config/environment'

welcome

Word.random_arr_of_words
#or words from seeds
GamePosition.create_new_game

#populate game words, clues, color positions v, default status is unflipped
#
# first_player = [r,b].sample
# [b,b,b,b,b,b,b,b,r,r,r,r,r,r,r,r,g,g,g,g,g,g,g,b] + first_player
# above array .sample(25)



# board = ["washington", "hat", "scuba diver", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
 

display_board(GamePosition.words_array)

get_guess_from_user_red
get_guess_from_user_blue

#
# character = get_guess_from_user
# game start
# get 25 words (generate, input, pull from list)
# assign colors of proper amount
# status start at all unflipped
# store in db
#
# turn consists of
# display new board
# clue
# player guess input or pass
# resolve guess
# switch teams or end game
