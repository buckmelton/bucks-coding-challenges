# Randomly shuffly the letters of a string into a new word.
def string_shuffle(s)
  s.split('').shuffle.join
end

# Driver code to test:
puts string_shuffle("foobar")  # => some rearrangement of "foobar"
