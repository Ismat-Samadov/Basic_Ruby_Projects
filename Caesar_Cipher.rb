def caesar_cipher(text, shift)
  encrypted_text = ""

  text.each_char do |char|
    char_code = char.ord

    case char_code
    when 97..122 then base = 97   # 'a'..'z'
    when 65..90  then base = 65   # 'A'..'Z'
    else
      encrypted_text << char
      next
    end

    rotated_code = base + (char_code - base + shift) % 26
    encrypted_text << rotated_code.chr
  end

  return encrypted_text
end

message = "Ismat"
encrypted_message = caesar_cipher(message, 10)
puts encrypted_message  # Output: "Scwi3"
