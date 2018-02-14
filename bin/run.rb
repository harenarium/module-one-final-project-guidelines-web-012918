require_relative '../config/environment'
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

load_image
welcome
Word.reset_words
select_words
turn_counter = GamePosition.create_new_game   #equals 1 or 2
Color.set_counter
display_board(GamePosition.formatted_words_array)

until GamePosition.black_card_guessed || Color.count_team_red ==0 || Color.count_team_blue == 0
  clue_number = computer_turn(turn_counter) + 1
  until clue_number == 0
    compare = turn_counter
    turn_counter = user_turns(turn_counter)
    if GamePosition.black_card_guessed|| Color.count_team_red ==0 || Color.count_team_blue == 0 || turn_counter != compare
      clue_number = 0
    elsif turn_counter == compare && clue_number ==1
      clue_number -=1
      turn_counter +=1
    elsif turn_counter == compare
      clue_number -=1
    end
  end
end
who_won(turn_counter)
