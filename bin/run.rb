require_relative '../config/environment'

welcome
Word.reset_words
select_words
GamePosition.create_new_game
Color.set_counter
display_board(GamePosition.formatted_words_array)
turn_counter = GamePosition.first_player #equals 1 or 2
until GamePosition.black_card_guessed || Color.count_team_red ==0 || Color.count_team_blue == 0
  turn_counter = user_turns(turn_counter)
    # turn_counter +=1
end
if GamePosition.black_card_guessed
  puts turn_counter%2 == 1 ? "Red Team, you lose!" : "Blue Team, you lose!"
elsif Color.count_team_red ==0
  puts "Red Team, you win!"
elsif Color.count_team_blue == 0
  puts "Blue Team, you win!"
end
