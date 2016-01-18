def caeser_cipher(to_encrypt,num_shifts)
  words = to_encrypt.split(' ')
  encrypted_words = []
  words.each do |word|
    letters = word.split('')
    encrypted_letters = []
    letters.each do |letter|
      encrypted_letter = letter.ord + num_shifts
      encrypted_letter = encrypted_letter - 26 if (encrypted_letter > 90 && encrypted_letter < 97) || (encrypted_letter > 122)
      encrypted_letters << encrypted_letter.chr
    end
    encrypted_words << encrypted_letters.join
  end
  encrypted_words.join(' ')
end

puts caeser_cipher('What a string!',5)