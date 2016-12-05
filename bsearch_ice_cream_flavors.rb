# Binary Search to find optimal spending on ice cream.
# Source: HackerRank 'Cracking The Coding Interview - Algorithms' module.

# Given m dollars and n flavors each with a cost, determine which two flavors
# to pick to spend all m dollars.

# See accompanying .png for more details.

# Wrote my own bsearch!
def bsearch(arr, cost, first=0, last=arr.length-1)
    if first > last
        return nil
    end
    mid = (first + last) / 2
    if arr[mid][0] == cost
        return arr[mid]
    elsif arr[mid][0] > cost
        return bsearch(arr, cost, first, mid-1)
    else
        return bsearch(arr, cost, mid+1, last)
    end

end

t = gets.strip.to_i
for a0 in (0..t-1)
    m = gets.strip.to_i # dollars available
    n = gets.strip.to_i # number flavors; flavors numbered from 1 to n
    a = gets.strip
    a = a.split(' ').map(&:to_i)    # costs

    # We have an array of costs, associate the flavor ID with each cost
    for i in 0..n-1
        a[i] = [a[i], i+1]
    end

    # Now sort by cost so we can do binary search on cost
    a.sort!

    # Now try each cost, and try to find another cost that totals the dollars available
    found_pair = nil
    a.each do |first_flavor|
        dollars_left = m - first_flavor[0]

        # We need to find a second flavor whose cost will add up to the dollars available.
        # Note that it can't be the same flavor (2nd part of && clause)
        if ((second_flavor = bsearch(a, dollars_left, 0, a.length-1)) != nil) &&
            (first_flavor[1] != second_flavor[1])
            found_pair = [first_flavor, second_flavor].sort {|x,y| x[1] <=> y[1]}
            break
        end
    end

    if found_pair != nil
        puts found_pair[0][1].to_s + " " + found_pair[1][1].to_s
    else
        puts "Can't spend all money exactly on two flavors."
    end
end
