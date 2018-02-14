require_relative "../config/environment.rb"

Color.create(color: "red")
Color.create(color: "blue")
Color.create(color: "gray")
Color.create(color: "black")

sa1 = ["EAGLE", "GAME", "WASHER", "BERRY", "SOLDIER", "SPRING", "PIANO", "COURT", "SPOT", "ENGINE", "SHAKESPEARE", "PAPER", "SOUND", "IVORY", "AMERICA", "JUPITER", "SHARK", "EUROPE", "SOUL"]
sa2 = ["SQUARE", "GREECE", "CIRCLE", "BED", "PLASTIC", "DWARF", "AIR", "CALF", "CLIFF", "LAB", "RULER", "BOMB", "GAS", "CAST", "MOSCOW", "CHANGE", "PALM", "TRIP", "CRANE"]
sa3 = ["ROSE", "FOREST", "BOTTLE", "WALL", "PANTS", "WIND", "GRACE", "KID", "OLIVE", "TABLE", "TIE", "SPINE", "PRESS", "WEB", "FAN", "FIGHTER", "WAKE", "WHALE", "DIAMOND"]
sa4 = ["MEXICO", "EYE", "POST", "RAY", "LITTER", "HEAD", "COMIC", "MAMMOTH", "MINT", "BUG", "HEART", "HOOD", "HORSESHOE", "HONEY", "NOVEL", "PIPE", "GLOVE", "BRIDGE", "ROBIN"]
sa5 = ["STREAM", "DICE", "SHIP", "HORN", "CARD", "TOWER", "POISON", "IRON", "MATCH", "LIFE", "LAP", "LOCK", "AMAZON", "DOCTOR", "BALL", "SEAL", "CROSS", "WHIP", "OCTOPUS"]
sa6 = ["KIWI", "CODE", "FILE", "BAR", "GROUND", "NOTE", "CZECH", "BACK", "WITCH", "STAFF", "MARBLE", "KETCHUP", "STAR ", "POOL", "LEAD", "WATCH", "BUGLE", "PART", "BUTTON"]
sa7 = ["FILM", "HIMALAYAS", "PITCH", "CROWN", "KING", "BEAR", "DISEASE", "STRAW", "SCALE", "FALSE", "SWITCH", "PORT", "GAS", "WELL", "HOLLYWOOD", "SCREEN", "FAIR", "DRESS", "AMBULANCE"]
sa8 = ["AUSTRALIA", "LIMOUSINE", "VACUUM", "ATLANTIS", "FACE", "BERLIN", "PIRATE", "HORSE", "BEACH", "CHARGE", "POUND", "SUB", "ROUND", "INDIA", "FIELD", "TRAIN", "CYCLE", "TELESCOPE", "ROME"]
sa9 = ["PLANE", "HOTEL", "PARACHUTE", "MOUNT", "BOX", "STICK", "CHAIR", "WATER", "PYRAMID", "OPERA", "ROBOT", "EMBASSY", "HAM", "DRAFT", "BATTERY", "ENGLAND", "SMUGGLER", "FOOT", "NEW-YORK"]
sa10 = ["STADIUM", "DRAGON", "PASS", "GREEN", "BIKE", "SCIENTIST", "ANTARCTICA", "REVOLUTION", "POINT", "TEACHER", "THUMB", "PUMPKIN", "COOK", "COTTON", "FISH", "TUBE", "POINT", "DATE", "DRILL"]
sa11 = ["FROM", "BLOCK", "NET", "MOON", "OIL", "SUPERHERO", "APPLE", "POLE", "BOND", "PAN", "QUEEN", "RABBIT", "ICE-CREAM", "WASHINGTON", "PIN", "LEPRECHAUN", "NURSE", "SPACE", "HOOK"]
sa12 = ["LINK", "DANCE", "BEIJING", "RACKET", "FLUTE", "CARROT", "BUFFALO", "DECK", "GOLD", "TICK", "ROW", "PISTOL", "BAND", "FIRE", "HOSPITAL", "SATURN", "DUCK", "RING", "CELL"]
sa13 = ["COVER", "LEMON", "TAG", "BELL", "ICE", "WORM", "ALPS", "DEATH", "STOCK", "ARM", "BERMUDA", "NUT", "SOCK", "PIT", "FLY", "SHOE", "MOLE", "SNOW", "TRUNK"]
sa14 = ["STATE", "TORCH", "BAT", "MASS", "COMPOUND", "SLUG", "TOOTH", "PLAY", "BRUSH", "LOCK", "KNIGHT", "MOUSE", "HELICOPTER", "CONTRACT", "MARCH", "PLATE", "LINE"]
sa15 = ["TRACK", "FORCE", "NINJA", "OLYMPUS", "ROCK", "LONDON", "CASINO", "TELL", "CRASH", "SPY", "UNICORN", "CAPITAL", "PLOT", "PUPIL", "SPIDER", "ANGEL", "SPELL", "GRASS", "MUG"]
sa16 = ["WHOLE", "BEAT", "MAIL", "UNDERTAKER", "CONCERT", "ORGAN", "JAM", "DOG", "CONDUCTOR", "SCUBA-DIVER", "CHURCH", "KNIFE", "JACK", "COPPER", "STRING", "NIGHT", "AZTEC", "MAPLE", "ORANGE"]
sa17 = ["TEMPLE", "THIEF", "NAIL", "BARK", "GIANT", "TAP", "MOUTH", "THEATER", "EGYPT", "CLUB", "SINK", "SERVER", "SCHOOL", "STRIKE", "KANGAROO", "BOARD", "CLOAK", "MICROSCOPE", "JET"]
sa18 = ["AGENT", "BUCK", "CRICKET", "COLD", "PENGUIN", "ROOT", "BOW", "DEGREE", "VAN", "VET", "TRIANGLE", "CAP", "CHINA", "BOLT", "POLICE", "LION", "FIGURE", "PARK", "SATELLITE"]
sa19 = ["LAWYER", "BILL", "DINOSAUR", "KEY", "SKYSCRAPER", "ALIEN", "CHOCOLATE", "SUIT", "SHADOW", "CENTAUR", "TURKEY", "MINE", "PIE", "SNOWMAN"]

seed_array = [sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8, sa9, sa10, sa11, sa12, sa13, sa14, sa15, sa16, sa17, sa18, sa19]

seed_array.each do |array|
  array.each do |seed|
    word = Word.find_or_create_by(word: seed) #354 became 351, means 3 pairs of duplicates
    word.in_game = false
    word.save
    # word = Word.new
    # word.word = seed
    # word.save
  end
end
