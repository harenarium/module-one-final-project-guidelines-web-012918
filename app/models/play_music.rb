def play_music
  pid = fork{exec "afplay", "media/mission_impossible_theme_softer.wav"}
end

def stop_music
  pid = fork{ exec "killall", "afplay"}
end

def game_over_sound
  pid = fork{exec "afplay", "media/game_death.wav"}
end

def not_valid_sound
  pid = fork{exec "afplay", "media/missed_sound.wav"}
end

def bystander_sound
  pid = fork{exec "afplay", "media/bystander_scream.wav"}
end
