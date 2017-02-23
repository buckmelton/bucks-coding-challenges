=begin

Compute the interquartile of an array of integers.
The interquartile is defined as the difference between the third quartile
and the first quartile.

Sample Input:
integers = 6 12 8 10 20 16
frequencies = 5 4 3 2 1 5

Sample Output:
9.0

=end

def median(ints)
    ints.sort!
    if ints.size.odd?
        return ints[ints.size/2]
    else
        return (ints[ints.size/2 - 1] + ints[ints.size/2]) / 2.0
    end
end

def quartiles(ints)
    q2 = median(ints).to_i
    q1 = median(ints[0..ints.size/2-1]).to_i
    if ints.size.odd?
        q3 = median(ints[ints.size/2+1..ints.size-1]).to_i
    else
        q3 = median(ints[ints.size/2..ints.size-1]).to_i
    end
    return [q1, q2, q3]
end

# Given an array of ints and a corresponding array
# of frequencies of those ints, return an array
# where each integer occurs with the given frequency.
# Example:
# [1,5,8]
# [3,1,5]
# Returns:
# [1,1,1,5,8,8,8,8,8]
def create_expanded_ints(ints, freqs)
    expanded_ints = []
    ints.each_with_index do |int, i|
        for i in 1..freqs[i]
            expanded_ints << int
        end
    end
    return expanded_ints
end

def interquartile(ints, freqs)
    expanded_ints = create_expanded_ints(ints, freqs)
    qs = quartiles(expanded_ints)
    return "%.1f" % (qs[2].to_f - qs[0])
end

######################################
# Driver code to test
ints = [6, 12, 8, 10, 20, 16]
freqs = [5, 4, 3, 2, 1, 5]

puts interquartile(ints, freqs)
# Answer should be 9.0
