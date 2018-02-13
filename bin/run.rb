require_relative '../config/environment'

welcome
#populate game words, clues, color positions v, default status is unflipped

first_player = [r,b].sample
[b,b,b,b,b,b,b,b,r,r,r,r,r,r,r,r,g,g,g,g,g,g,g,b] + first_player
above array .sample(25)



board = ["washington", "hat", "scuba diver", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
display_board(board)



output a clue
#
# character = get_guess_from_user
# game start
# get 25 words 
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
#
# colors  https://stackoverflow.com/questions/1489183/colorized-ruby-output
# def bg_black;       "\e[40m#{self}\e[0m" end
# def bg_red;         "\e[41m#{self}\e[0m" end
# def bg_green;       "\e[42m#{self}\e[0m" end
# def bg_brown;       "\e[43m#{self}\e[0m" end
# def bg_blue;        "\e[44m#{self}\e[0m" end
# def bg_magenta;     "\e[45m#{self}\e[0m" end
# def bg_cyan;        "\e[46m#{self}\e[0m" end
# def bg_gray;        "\e[47m#{self}\e[0m" end
