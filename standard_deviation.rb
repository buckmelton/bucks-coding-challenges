=begin

Calculate the standard deviation of an array of ints.
The standard deviation is the square root of of the average
squared distance from the mean.

Sample Input:
10 40 30 50 20

Sample Output:
14.1

=end

def mean(ints)
    return ints.reduce(0, :+) / ints.size.to_f
end

def stddev(ints)
    the_mean = mean(ints)
    sum_square_dists = ints.reduce(0) { |sum, int| sum += (int - the_mean)**2 }
    return Math.sqrt(sum_square_dists / ints.size.to_f)
end

####################################################
# Driver code to test

ints = [10,40,30,50,20]

puts "%.1f" % stddev(ints)
