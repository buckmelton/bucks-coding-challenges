=begin
First attempt

def get_max_profit(prices)
    prices_with_indices = prices.each_with_index.map {|price, i| [price, i]}
    prices_with_indices.sort!
    i_left = 0
    i_right = prices_with_indices.length-1
    while i_left < i_right

        if prices_with_indices[i_left][1] < prices_with_indices[i_right][1]
            return prices_with_indices[i_right][0] - prices_with_indices[i_left][0]
        end

        if prices_with_indices[i_left+1][0] - prices_with_indices[i_left][0] <
                prices_with_indices[i_right][0] - prices_with_indices[i_right-1][0]
            i_left += 1
        else
            i_right -= 1
        end
    end

    # We'll only get here if the price only went down all day.
    # In that case, the best profit would be the smallest drop between
    # adjacent times.
    max = prices[1] - prices[0]
    for i in 1..prices.length-2
      if prices[i+1] - prices[i] > max
        max = prices[i+1] - prices[i]
      end
    end
    return max

end

=end

def get_max_profit(prices)

  if prices.length < 2
    raise IndexError, 'Must have at least two stock prices to compute profit.'
  end

  min_price = prices[0]
  max_profit = prices[1] - prices[0]

  prices.each_with_index do |price, i|
    next if i == 0 # We already did this clause

    possible_profit = price - min_price

    max_profit = [max_profit, possible_profit].max
    min_price = [price, min_price].min

  end

  return max_profit

end

#stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
stock_prices_yesterday = [10, 2, 7, 5, 8, 11, 9, 20]
# stock_prices_yesterday = [10, 6, 4, 2]
puts get_max_profit(stock_prices_yesterday)
