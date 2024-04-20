def stock_picker(prices)
  # Initialize variables to keep track of maximum profit and best buy/sell days
  max_profit = 0
  best_buy_day = 0
  best_sell_day = 0

  # Iterate over each day (except the last one)
  (0...prices.length - 1).each do |buy_day|
    # Iterate over the following days to find the best sell day
    ((buy_day + 1)...prices.length).each do |sell_day|
      # Calculate the profit for the current pair of buy and sell days
      profit = prices[sell_day] - prices[buy_day]

      # Update max_profit and best buy/sell days if a higher profit is found
      if profit > max_profit
        max_profit = profit
        best_buy_day = buy_day
        best_sell_day = sell_day
      end
    end
  end

  # Return the pair of days representing the best buy and sell days
  return [best_buy_day, best_sell_day]
end

# Example usage:
result = stock_picker([17,3,6,9,15,8,6,1,10])
puts result.inspect  # Output: [1, 4] for a profit of $15 - $3 == $12
