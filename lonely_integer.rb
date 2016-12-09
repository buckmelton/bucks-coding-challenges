# Input: an array of an odd number of ints, all of which are matched in pairs,
# except for one that isn't.
# Output: the unmatched integer.
# Example:
# Input: [0,0,1,2,1]
# Output: 2 (the one unique integer)

=begin

# First solution: NOT using bit manipulation:

def lonely_integer(arr)
    num_hash = {}
    arr.each do |num|
        if num_hash.has_key?(num)
            num_hash.delete(num)
        else
            num_hash[num] = 1
        end
    end

    return num_hash.keys[0]
end

arr = [0,2,8,4,4,9,2,0,9] # 8 is unique
puts lonely_integer(arr)

=end

=begin

Second solution: using bit manipulation

Any number xor'ed with itself gives zero.
Any number xor'ed with zero gives itself.
Just xor all the numbers together, all the pairs will cancel each other
out, and at the end you'll be left with the only number that wasn't canceled
out: the unique number.

To help visualize this:
Say we have a vertical list of binary numbers, say with 4 digits each.  Say there
are five of them. If we go down each column, there will be two pairs of identical
digits, and one unique digit.  If we xor them all together (order doesn't matter),
you can try by experimentation that the result will be the unique digit.  Repeat
this for each column, and you'll end up with the unique number

1 1 0 1
0 1 1 0
1 1 0 1
1 0 0 1
0 1 1 0

xor the columns:

1 0 0 1

Voila!

=end

def lonely_integer_bit(arr)

    val = 0
    arr.each do |n|
        val ^= n
    end

    return val

end

arr = [0,2,8,4,4,9,2,0,9] # 8 is unique
puts lonely_integer_bit(arr)
