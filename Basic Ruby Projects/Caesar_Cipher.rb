# ENCRYPTS A GIVEN TEXT USING THE CAESAR CIPHER WITH A SPECIFIED SHIFT

def caesar_cipher(text, shift)
  # INITIALIZE AN EMPTY STRING TO STORE THE ENCRYPTED TEXT
  encrypted_text = ""

  # ITERATE OVER EACH CHARACTER IN THE TEXT
  text.each_char do |char|
    # GET THE ASCII CODE OF THE CURRENT CHARACTER
    char_code = char.ord

    # CHECK IF THE CHARACTER IS A LOWERCASE LETTER ('a'..'z') OR UPPERCASE LETTER ('A'..'Z')
    case char_code
    when 97..122 then base = 97   # ASCII RANGE FOR LOWERCASE LETTERS
    when 65..90  then base = 65   # ASCII RANGE FOR UPPERCASE LETTERS
    else
      # IF THE CHARACTER IS NOT A LETTER, APPEND IT TO THE ENCRYPTED TEXT AS IS AND MOVE TO THE NEXT CHARACTER
      encrypted_text << char
      next
    end

    # APPLY THE CAESAR CIPHER SHIFT AND WRAP AROUND THE ALPHABET IF NEEDED
    rotated_code = base + (char_code - base + shift) % 26

    # APPEND THE ENCRYPTED CHARACTER TO THE ENCRYPTED TEXT
    encrypted_text << rotated_code.chr
  end

  # RETURN THE ENCRYPTED TEXT
  return encrypted_text
end

# EXAMPLE USAGE:
message = "Ismat"
encrypted_message = caesar_cipher(message, 10)
puts encrypted_message  # OUTPUT: "Scwi3"
