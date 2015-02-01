
def encode(n, input_string)
  i = 0
  j = 0
  k = 1
  cipher_strings = []
  cipher = ""
  while i < n
    cipher_strings.push("")
    i += 1
  end
  i=0
  while i < input_string.length
    cipher_strings[j] += input_string[i]
    j += k
    if j == 0 || j == n-1
      k *= -1
    end
    i += 1
  end

  i = 0
  while i < cipher_strings.length
    cipher += cipher_strings[i]
    i += 1
  end
  return cipher
end

def decode(n, input_string)
  
end

puts encode(2, 'LOLOLOLOLOLOLOLOLO')
puts encode(3, 'REDDITCOMRDAILYPROGRAMMER')
puts encode(4, 'THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG')

if encode(4, 'THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG') == "TCNMRZHIKWFUPETAYEUBOOJSVHLDGQRXOEO"
  puts "it works!"
end
