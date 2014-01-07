class Guessing_game
  def initialize (answer)
    @answer = answer
    @solved = false
    @valid_numbers = (1..100).to_a # Store valid answers in an array
    # Validate input
    raise "Answer must be between 1 and 100" unless @valid_numbers.include?(@answer)
  end

  def guess (number)
    @solved = false
    if number == @answer # Check if the two are equal
      @solved = true
      :correct
    else
      number > @answer ? :high : :low
    end
  end

  def solved?
    @solved
  end

end

game = Guessing_game.new(10)

# This following should print out a whole bunch lines of "true"
puts game.guess(5)  == :low
puts game.guess(15) == :high
puts game.solved?   == false
puts game.guess(10) == :correct
puts game.solved?   == true
puts game.guess(2)  == :low
puts game.solved?   == false

begin
  Guessing_game.new(200)
rescue RuntimeError => e
  puts e.to_s == "Answer must be between 1 and 100"
end