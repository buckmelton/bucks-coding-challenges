=begin

Source: HackerRank (although this is a very common recursive challenge, often
used to demonstrate the memoization method of dynamic programming).

If you can climb 1, 2, or 3 steps at a time, how many ways are there to
climb a staircase of n steps?
For instance if there are 3 steps, there are 4 ways to climb them:
#1: 1 step, 1 step 1 step
#2: 1 step, 2 steps
#3: 2 steps, 1 step
#4: 3 steps

=end

def staircase(n)
    memo = {}

    stair_helper = lambda do |num_stairs|
        return 1 if num_stairs == 1
        return 2 if num_stairs == 2
        return 4 if num_stairs == 3
        if !memo.has_key?(num_stairs)
            memo[num_stairs] = stair_helper.call(num_stairs-1) +
                               stair_helper.call(num_stairs-2) +
                               stair_helper.call(num_stairs-3)
        end
        return memo[num_stairs]
    end

    return stair_helper.call(n)

end

################################
# Driver code to test
input = [2,4,7]

input.each do |num_stairs|
  puts "If you have #{num_stairs} steps, there are #{staircase(num_stairs)} ways to reach the top."
end
