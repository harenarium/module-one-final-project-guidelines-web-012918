def play_music
  pid = fork{ exec "afplay", "media/mission_impossible_theme_softer.wav"}
  # pid = fork{ exec ‘killall’, “afplay” }
end

def stop_music
  pid = fork{ exec "killall", "afplay"}
end
