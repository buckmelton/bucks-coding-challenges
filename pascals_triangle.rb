=begin

Pascal's triangle
Input: integer n
Output: array of arrays representing each row of pascal's triangle

Pseudocode
Create result array
Put first row in [1]
For each remaining row
  First element is 1
  For each element from 2nd to 2nd to Last
    element equal sum element-1 of prev row and element with same index
    push element into array for this row
  Last element is 1
  push row onto result array
=end

def pascals_triangle(n)

  # Put first row into result
  result = [[1]]

  for r in 2..n
    puts "r: #{r}"
    row = []
    row << 1
    for e in 1..r-2
      puts "e: #{e}"
      p row
      p result
      elem = result[r-2][e-1] + result[r-2][e]
      row << elem
    end
    row << 1
    result << row
  end

  return result

end

##########################################
# Driver code to test

p pascals_triangle(6)
