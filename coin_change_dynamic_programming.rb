=begin

Dynamic Programming Coin Change

Given a total number of dollars n, and m coin denominations in dollars,
compute how many ways there are to make change for n with an infinite
supply of all coin denominations.

Example:
Input: n = 4, m = 3, coins: 1, 2, 3
Output: 4
Explanation:
There are 4 ways to make change for 4 dollars with 1-dollar, 2-dollar, and
3-dollar coins:
1,1,1,1
1,2,1
2,2
1,3

Analysis:
Recursive.
Number of ways to make change equals the sum of the number of ways to make change without the
last coin in the list for the total amount, plus the number of ways to make
change WITH the last coin in the list for the total amount MINUS the value of
one of the last coin.

Example:
#1 Use the example from above.
The number of ways to make change for 4 dollars from 1, 2, and 3-dollar coins, is
the sum of the number of ways to make change for 4 dollars from 1 and 2-dollar
coins, plus the number of ways to make change for 1 dollar from 1, 2, and 3-dollar
coins.

#2 n = 10, coins = [1,2,5]
The number of ways to make change for 10 dollars from 1, 2, and 5-dollar coins, is
the sum of the number of ways to make change for 10 dollars from 1 and 2-dollar
coins, plus the number of ways to make change for 5 dollars from 1, 2, and 5-dollar
coins.


Base cases:
If the total is or becomes zero at any point, there is 1 way: no coins.
If the total is or becomes below zero at any point, there are 0 ways to provide a negative total.
If the number of coins goes to zero or below (and total is still above zero), there are 0 to
make that total.

=end

def coin_change_dp(total, coins)

  # Hash to keep results we've already computed (dynamic programming).
  memo = {}

  # Recursive method.
  coin_change_helper = lambda do |tot, c_arr|

    # If total is 0 then there is 1 solution (do not include any coin).
    if tot == 0
      return 1
    end

    # If total is less than 0 then no solution exists.
    if tot < 0
      return 0
    end

    # If there are no coins and total is greater than 0, then no solution exists.
    if c_arr.length == 0 && tot > 0
      return 0
    end

    # The result is the sum of solutions (i) including last coin (ii) excluding last coin

    coins_wo_last_coin = c_arr.slice(0, c_arr.length-1) # remove last coin from coin choices

    # Dynamic programming
    # If the number of ways to make change without the last coin has already been
    # computed, it's in the hash, use it.
    # If it's not in the hash, compute it and put it in the hash for future calls
    # that need it.
    if !memo.has_key?([tot, coins_wo_last_coin])
        memo[[tot, coins_wo_last_coin]] = coin_change_helper.call(tot, coins_wo_last_coin)
    end

    # Same for making change with the last coin.
    if !memo.has_key?([tot-c_arr[-1], c_arr])
        memo[[tot-c_arr[-1], c_arr]] = coin_change_helper.call(tot-c_arr[-1], c_arr)
    end

    # Result is sum of two items above, also stick it in the memoization hash
    # so we don't have to recompute it if needed again.
    memo[[tot, c_arr]] = memo[[tot, coins_wo_last_coin]] + memo[[tot-c_arr[-1], c_arr]]
    return memo[[tot, c_arr]]

  end

  return coin_change_helper.call(total, coins)

end

########################################
# Driver code for testing

n = 5
coins = [1,2,3]
puts "There are #{coin_change_dp(n,coins)} ways to make change for #{n.to_s} dollars from the coins:"
p coins
