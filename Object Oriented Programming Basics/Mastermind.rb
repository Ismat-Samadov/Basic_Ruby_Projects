class Mastermind
  COLORS = %w[red blue green yellow orange purple].freeze  # Define the possible colors for the secret code
  CODE_LENGTH = 4  # Define the length of the secret code
  MAX_TURNS = 12   # Define the maximum number of turns the player has

  def initialize
    @secret_code = generate_secret_code  # Generate a random secret code
    @turns_left = MAX_TURNS  # Set the initial number of turns left
  end

  def play
    puts "Welcome to Mastermind!"  # Display welcome message
    puts "Try to guess the secret code. The code consists of four colors: #{COLORS.join(', ')}"
    puts "You have #{@turns_left} turns to guess the code."

    until @turns_left.zero?  # Continue the game until no turns are left
      guess = get_guess  # Get the player's guess
      if correct_guess?(guess)  # Check if the guess is correct
        puts "Congratulations! You guessed the secret code: #{@secret_code}"
        return  # End the game
      else
        feedback(guess)  # Provide feedback on the guess
        @turns_left -= 1  # Decrement the number of turns left
        puts "Turns left: #{@turns_left}"  # Display the remaining turns
      end
    end

    puts "Sorry, you didn't guess the secret code. It was: #{@secret_code}"
  end

  private

  def generate_secret_code
    Array.new(CODE_LENGTH) { COLORS.sample }  # Generate a random secret code
  end

  def get_guess
    print "Enter your guess (e.g., red blue green yellow): "
    gets.chomp.downcase.split  # Get the player's guess and split it into an array of colors
  end

  def correct_guess?(guess)
    guess == @secret_code  # Check if the guess matches the secret code
  end

  def feedback(guess)
    exact_matches = 0  # Initialize the count of exact matches
    color_matches = 0  # Initialize the count of color matches
    secret_code_copy = @secret_code.dup  # Create a copy of the secret code

    guess.each_with_index do |color, index|
      if color == secret_code_copy[index]  # Check for exact matches
        exact_matches += 1
        secret_code_copy[index] = nil  # Mark the matched color as nil
      elsif secret_code_copy.include?(color)  # Check for color matches
        color_matches += 1
        secret_code_copy[secret_code_copy.index(color)] = nil  # Mark the matched color as nil
      end
    end

    puts "Feedback: Exact matches: #{exact_matches}, Color matches: #{color_matches}"  # Display feedback
  end
end

game = Mastermind.new
game.play  # Start the game
