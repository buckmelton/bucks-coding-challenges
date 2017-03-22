=begin
Given an array of integers, calculate which fraction of its elements are positive,
which fraction of its elements are negative, and which fraction of its elements
are zeroes, respectively. Print the decimal value of each fraction on a new line,
with 6 places after the decimal point.

Sample Input:
[-4, 3, -9, 0, 4, 1]

Sample Output:
0.500000
0.333333
0.166667

=end

def plus_minus(arr)

  num_pos = (arr.find_all { |e| e > 0 }).size
  num_neg = (arr.find_all { |e| e < 0 }).size
  num_zero = (arr.find_all { |e| e == 0 }).size

  result = []
  result << sprintf( "%0.06f", num_pos / arr.size.to_f)
  result << sprintf( "%0.06f", num_neg / arr.size.to_f)
  result << sprintf( "%0.06f", num_zero / arr.size.to_f)

  return result

end

###########################
# Driver code to test

arr = [-4, 3, -9, 0, 4, 1]
puts plus_minus(arr)
