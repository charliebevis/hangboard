class Hangboard
  def initialize
    @waiter = Waiter.new
    @sayer = Sayer.new
  end

  def one_rep
    puts "\rrest"
      countdown(5)

    puts "\rdeadhang"
    countdown(10)
  end

  def countdown(seconds)
    seconds.downto(1) do |i|
      clear_terminal_line
      print "\r#{i}"
      @sayer.say i if i <= 3
      @waiter.wait
    end
  end

  def one_hold
    6.times do |i|
      puts "\rstarting rep #{i}"
      one_rep
    end
  end

  def workout(holds: 1)
    holds.times do |i|
      rest_between_holds if holds - i > 1
      one_hold
    end
  end

  def clear_terminal_line
    print "\r" + " " * 80
  end

  def rest_between_holds
    @waiter.rest
  end
end

class Waiter
  def wait
    sleep 1
  end

  def rest
    sleep 3*60
  end
end

class Sayer
  def say(phrase)
    Thread.new{ `say #{phrase}`}
  end
end
