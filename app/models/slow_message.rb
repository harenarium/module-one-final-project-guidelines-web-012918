def slow_message(str)
  str.split(" ").each do |word|
    print word + " "
    sleep(0.5)
  end
end
