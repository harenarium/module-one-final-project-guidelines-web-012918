def slow_message(str)
  str.split(" ").each do |word|
    print word + " "
    sleep(0.3)
  end
end

def say_message
  t1 = Thread.new{system("say Your mission. should you choose to accept it, is to make contact with all of our agents in the field, before your opponent contacts all of theirs. You are passing on vital information that we don’t want in enemy hands. Available to you are the locations of 25 known persons identified only by their code names. Among them stand your fellow agents, enemy spies and random civilians. Oh and there’s an assassin. The enemy is monitoring our communication lines so communication will be limited, but the spy master will send you what information we can. Be aware the enemy may try to feed false leads to your team. As always should any member of your team be caught or killed, the secretary will disavow any knowledge of your actions. Good luck! -r 218")}
  t2 = Thread.new{slow_message("Your mission, should you choose to accept it, is to make contact with all of our agents in the field before your opponent contacts all of theirs. You are passing on vital information that we don’t want in enemy hands. Available to you are the locations of 25 known persons identified only by their code names. Among them stand your fellow agents, enemy spies, and random civilians. Oh, and there’s an assassin. The enemy is monitoring our communication lines so communication will be limited but the spy master will send you what information we can. Be aware, the enemy may try to feed false leads to your team. As always, should any member of your team be caught or killed, the secretary will disavow any knowledge of your actions. Good luck!")}
  t1.join
  t2.join
end

def bold
  "\e[1m#{self}\e[22m"
end
