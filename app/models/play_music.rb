def play_music
  pid = fork{ exec "afplay", "media/mission_impossible_theme.mp3"}
  # pid = fork{ exec ‘killall’, “afplay” }
end

def stop_music
  pid = fork{ exec "killall", "afplay"}
end
