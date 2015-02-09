
def negativeBase(n, r)
  #assume we get an int
  r_string = r.to_s
  if r_string.length == 0
    return 0
  end
  value = 0
  value2 = ""
  power = 0
  while r_string.length != 0
    #puts r_string[r_string.length-1]
    value += r_string[r_string.length-1].to_i*(n**power)
    r_string = r_string[0...-1]
    power += 1
  end
  return value
end

puts negativeBase(-10, 7211)
puts negativeBase(-10, 12345678)
puts negativeBase(-7, 4021553)
#puts negativeBase(7, 4016423)
