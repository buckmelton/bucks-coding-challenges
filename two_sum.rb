# Two sum
# Source: LeetCode

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# Assume that each input would have exactly one solution.

=begin

Strategy:

Naive brute force method would be to have two nested loops, for each element, loop through
all the other elements and sum the two.   When the sum equals the target, return the indices.
However, this would be O(n^2).

A better way is to create a hash, go through all the elements once and put them in the
hash with the element value as the key and its index as the value.
Then go through each element of the array a second time, and look for the complement
(i.e. target-element) in the hash.  If you find the complement, return the index of the
current element and the value of the found key (which is the index of the complement).

=end

def make_hash(arr)
    the_hash = {}
    arr.each_with_index do |x, i|
        the_hash[x] = i
    end
    return the_hash
end

def two_sum(nums, target)
    num_hash = make_hash(nums)
    nums.each_with_index do |num, idx|
        # You can't use the same element twice, so test to make sure the
        # two indices aren't equal.
        if num_hash.has_key?(target-num) && idx != num_hash[target-num]
            return [idx, num_hash[target-num]]
        end
    end
    return nil
end
