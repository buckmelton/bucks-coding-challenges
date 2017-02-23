=begin
Given a list of integers and a list of their weights, print the weighted mean.
The answer should be rounded to a scale of 1 decimal place.

Sample Input:
5
10 40 30 50 20
1 2 3 4 5

Sample Output:
32.0

Challenge adapted from HackerRank Statistics module.
=end

def weighted_mean(ints, weights)
    weighted_sum = ints.each_with_index.reduce(0) { |sum, (elem, i)| sum += elem * weights[i] }
    return weighted_sum / weights.reduce(0, :+).to_f
end

##########################################
# Driver code to test

puts "How many integers are in your list?"
num_ints = gets.chomp

puts "Please list the integers, separated by spaces:"
ints_arr = gets.chomp.split.map(&:to_i)

puts "Please list the weights, separated by spaces:"
weights_arr = gets.chomp.split.map(&:to_i)

puts "The weighted mean of your list is:"
puts "%.1f" % weighted_mean(ints_arr, weights_arr)
