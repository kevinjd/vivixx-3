@voter = 1
@maxvotes = 5
@result = []
@candidates = [
  {name:'mika',votes:0},
  {name:'reggie',votes:0},
  {name:'kenneth',votes:0},
  {name:'trevor',votes:0},
]

def equalz(n)
  return "="*n
end

def blanker(n)
  return "\n"*n
end

def arrowz
  return "========>"
end

def centerer(x)
  return x.center(71,' ')
end


def startArt
  system "cls"
  puts equalz(71)
  puts centerer('REPUBLIC OF VIVIXX')
  puts equalz(71)
  puts """
   ██▒   █▓ ▒█████  ▄▄▄█████▓▓█████     ███▄    █  ▒█████   █     █░
  ▓██░   █▒▒██▒  ██▒▓  ██▒ ▓▒▓█   ▀     ██ ▀█   █ ▒██▒  ██▒▓█░ █ ░█░
   ▓██  █▒░▒██░  ██▒▒ ▓██░ ▒░▒███      ▓██  ▀█ ██▒▒██░  ██▒▒█░ █ ░█
    ▒██ █░░▒██   ██░░ ▓██▓ ░ ▒▓█  ▄    ▓██▒  ▐▌██▒▒██   ██░░█░ █ ░█
     ▒▀█░  ░ ████▓▒░  ▒██▒ ░ ░▒████▒   ▒██░   ▓██░░ ████▓▒░░░██▒██▓
     ░ ▐░  ░ ▒░▒░▒░   ▒ ░░   ░░ ▒░ ░   ░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ░ ▓░▒ ▒
     ░ ░░    ░ ▒ ▒░     ░     ░ ░  ░   ░ ░░   ░ ▒░  ░ ▒ ▒░   ▒ ░ ░
       ░░  ░ ░ ░ ▒    ░         ░         ░   ░ ░ ░ ░ ░ ▒    ░   ░
        ░      ░ ░              ░  ░            ░     ░ ░      ░
        ░
  """
  puts "VOTES REMAINING: #{@maxvotes+1-@voter}".center(71,'=')
  print centerer('PRESS ENTER TO START')
  gets.chomp
end

def showMain
  system "cls"
  puts blanker(6)
  puts centerer("Hello VOTER ##{@voter}, what's your name?")
  print " "*30+"> "
  name = gets.chomp.upcase
  system "cls"
  puts blanker(2)
  puts centerer("Hello #{name}, you are VOTER##{@voter}")
  puts ""
  puts equalz(71)
  puts centerer("HERE ARE THE LIST OF CANDIDATES")
  puts equalz(71)
  puts centerer("MIKA")
  puts centerer("REGGIE")
  puts centerer("KENNETH")
  puts centerer("TREVOR")
  puts equalz(71)
  puts centerer("1. SIMPLY ENTER THE NAME OF YOUR CHOICE")
  puts centerer("2. WRONG SPELLING WON'T BE COUNTED")
  puts equalz(71)
  print " "*15 + "ENTER CANDIDATE NAME> "
  choice = gets.chomp
  addVote(choice)
end

def thanksScreen
  system "cls"
  puts blanker(6)
  puts centerer("THANK YOU! YOUR VOTE HAS BEEN ADDED")
  print " "*30+"> "
  cont = gets
end

def errorScreen
  system "cls"
  puts blanker(6)
  puts centerer("SORRY! INVALID NAME, YOUR VOTE IS NOT COUNTED")
  print " "*30+"> "
  cont = gets
end

def addVote(choice)
  choice = choice.downcase
  y = 0
  @candidates.each do |x|
    if x[:name] == choice
      x[:votes] +=1
      y += 1
    end
  end

  @voter += 1
  if y > 0
    thanksScreen
  else
    errorScreen
  end
end

def whoWon
  @candidates.each do |x|
    @result.push(x[:votes].to_s+" "+x[:name])
  end
  @result = @result.sort.reverse
  @result = @result[0].split(" ")
  @result = @result[1]
  return @result
end


def g(v,l)
  v=((v.to_f/l.to_f)*20).floor
  s=20-v.to_f
  return " ["+"="*v.to_i+" "*s.to_i+"]"+"#{((v/20.to_f)*100).floor}%"
end


def showResults
  system "cls"
  puts equalz(71)
  puts centerer('HERE ARE THE RESULTS')
  puts equalz(71)
  puts blanker(2)
  @candidates.each do |x|
    puts (x[:name].upcase.center(10,' ') + " " + g(x[:votes].to_i,@voter)).center(71,' ')
  end
  puts blanker(2)
  puts equalz(71)
  puts equalz(71)
  puts centerer(whoWon.upcase + " IS THE NEW PRESIDENT OF VIVIXX")
  puts equalz(71)
  puts equalz(71)
end

while @voter<@maxvotes+1
  startArt
  showMain
end

showResults
