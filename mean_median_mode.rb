=begin

Compute and print the mean, median, and mode of a list of integers.
Read input from STDIN. Print output to STDOUT.

Sample Input:
10  # Number of integers in the list
64630 11735 14216 99233 14470 4978 73429 38120 51135 67060

Sample Output:
43900.6
44627.5
4978

Challenge drawn from HackerRank Statistics Module.

=end

def mean(arr)
    return arr.reduce(0, :+) / arr.size.to_f
end

def median(arr)
    arr.sort!
    if arr.size.odd?
        return arr[arr.size/2]
    else
        return (arr[arr.size/2 - 1] + arr[arr.size/2]) / 2.0
    end
end

def mode(arr)
    freq_hash = {}
    arr.each do |elem|
        if freq_hash.key?(elem)
            freq_hash[elem] += 1
        else
            freq_hash[elem] = 1
        end
    end
    return freq_hash.key(freq_hash.values.max)
end

###############################################
# Driver Code To Test:

puts "How many integers in your list?:"
num_elements = gets.chomp

puts "Enter list of integers separated by spaces:"
elements_arr = gets.chomp.split.map(&:to_i)

puts "Mean is: " + mean(elements_arr).to_s
puts "Median is: " + median(elements_arr).to_s
puts "Mode is: " + mode(elements_arr).to_s
