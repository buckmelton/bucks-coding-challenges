=begin

Compute the quartiles of an array of integers, Q1, Q2, and Q3.

Q2 is simply the median of the entire array.

If the total number of integers is even, then Q1 is the median of the smaller
half of the array of integers, and Q3 is the median of the larger half of the array of integers.

If the total number of integers is odd, remove the median from the array (so that the array now has an even number of integers), and compute Q1 and Q3 as above.

Sample Input:
3 7 8 5 12 14 21 13 18

Sample Output:
Q1 = 6
Q2 = 12
Q3 = 16

Explanation:

When we sort the elements, we get [3,5,7,8,12,13,14,18,21].
It's easy to see that Q2 is the median, 12.
Since the array has an odd number of integers, we remove the median and for Q1 and Q3 we
find the medians of the lower half [3,5,7,8] and the upper half [13,14,18,21].
Q1 = 6
Q3 = 16

=end


def median(arr)
    arr.sort!
    if arr.size.odd?
        return arr[arr.size/2]
    else
        return (arr[arr.size/2 - 1] + arr[arr.size/2]) / 2.0
    end
end

puts "How many integers in your list?"
num_ints = gets.chomp.to_i
puts "Please list the integers, separated by spaces:"
ints = gets.chomp.split.map(&:to_i)
q2 = median(ints).to_i
q1 = median(ints[0..ints.size/2-1]).to_i
if ints.size.odd?
    q3 = median(ints[ints.size/2+1..ints.size-1]).to_i
else
    q3 = median(ints[ints.size/2..ints.size-1]).to_i
end

puts "Q1 = " + q1.to_s
puts "Q2 = " + q2.to_s
puts "Q3 = " + q3.to_s
