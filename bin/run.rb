require_relative '../config/environment'

welcome
Word.reset_words
select_words
# Word.random_arr_of_words
#or Word.random_words_from_seed
GamePosition.create_new_game
Color.set_counter
display_board(GamePosition.formatted_words_array)
user_turns




# get_guess_from_user_red
# get_guess_from_user_blue

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
