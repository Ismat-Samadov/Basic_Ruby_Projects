def fizzbuzz(n)
  # Define a hash to store conditions and corresponding output strings
  conditions = {
    3 => "Fizz",
    5 => "Buzz"
  }

  # Iterate from 1 to n, inclusive
  (1..n).each do |i|
    output = ""  # Initialize an empty string for the output

    # Iterate through the conditions hash
    conditions.each do |divisor, word|
      # Check if the current number is divisible by the divisor
      # Append the corresponding output string to the output if divisible
      output << word if i % divisor == 0
    end

    # Print the output string if not empty, otherwise print the number itself
    puts output.empty? ? i : output
  end
end

# Example
fizzbuzz(15)
