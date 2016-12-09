=begin

Source: HackerRank (although this is a very common recursive challenge, often
used to demonstrate the memoization method of dynamic programming).  Here I am
attempting to use tabulation and iteration.

If you can climb 1, 2, or 3 steps at a time, how many ways are there to
climb a staircase of n steps?
For instance if there are 3 steps, there are 4 ways to climb them:
#1: 1 step, 1 step 1 step
#2: 1 step, 2 steps
#3: 2 steps, 1 step
#4: 3 steps

=end

def staircase_tabulation(n)
    stair_tab = {}
    stair_tab[1] = 1
    stair_tab[2] = 2
    stair_tab[3] = 4

    for i in 4..n
      stair_tab[i] = stair_tab[i-1] + stair_tab[i-2] + stair_tab[i-3]
    end

    return stair_tab[n]

end

################################
# Driver code to test
input = [2,4,7]

input.each do |num_stairs|
  puts "If you have #{num_stairs} steps, there are #{staircase_tabulation(num_stairs)} ways to reach the top."
end
