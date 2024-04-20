def substrings(word, dictionary)
  # Initialize an empty hash to store substring counts
  substr_count = Hash.new(0)

  # Split the word into individual words
  words = word.downcase.split

  # Iterate over each word
  words.each do |w|
    # Iterate over each substring in the dictionary
    dictionary.each do |substr|
      # If the word contains the substring, update its count
      substr_count[substr] += 1 if w.include?(substr)
    end
  end

  # Return the hash containing substring counts
  return substr_count
end

# Example usage:
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
# Output: { "below" => 1, "low" => 1 }

p substrings("Howdy partner, sit down! How's it going?", dictionary)
# Output: { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
