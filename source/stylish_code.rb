class GuessingGame
  VALID_NUMBERS = (1..100).to_a

  def initialize answer;
    @answer = answer
    @solved = false
    raise "Answer must be between 1 and 100" unless VALID_NUMBERS.include? @answer
  end

  def guess (number)
    if number == @answer
      @solved = true
      return :correct
    elsif number > @answer
      @solved = false
      return :high
    else
      @solved = false
      return :low
    end
  end

  def solved?
    @solved
  end
end

game = GuessingGame.new(10)

# This following should print out a whole bunch lines of "true"
puts game.guess(5) == :low
puts game.guess(15) == :high
puts game.solved?  == false
puts game.guess(10) == :correct
puts game.solved? == true
puts game.guess(2) == :low
puts game.solved? == false

begin
  GuessingGame.new(200)
rescue RuntimeError => e
  puts e.to_s == "Answer must be between 1 and 100"
end