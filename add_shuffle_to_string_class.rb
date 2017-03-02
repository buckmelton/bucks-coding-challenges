class String
  # Randomly shuffle the letters of a string into a new word.
  def shuffle
    self.split('').shuffle.join
  end

end

# Driver code to test:
puts "foobar".shuffle  # => some rearrangement of "foobar"
