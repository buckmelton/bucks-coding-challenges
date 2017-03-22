=begin

Given an array of positive integers, find the minimum and maximum values that can
be calculated by summing exactly n-1 of the n integers. Then print the
respective minimum and maximum values as a single line of two space-separated integers.

Input Format:
Array of positive ints

Output Format:
Print two space-separated long integers denoting the respective minimum and
maximum values that can be calculated by summing exactly n-1 of the n integers.

Sample Input:
[1,2,3,4,5]

Sample Output:
10 14

=end

def mini_max_sum(arr)

    sum = arr.reduce(0, :+)

    max = arr.max
    min_sum = sum - max

    min = arr.min
    max_sum = sum - min

    return [min_sum, max_sum]

end

####################
# Driver code to test

result = mini_max_sum([1,2,3,4,5])
puts result[0].to_s + " " + result[1].to_s
