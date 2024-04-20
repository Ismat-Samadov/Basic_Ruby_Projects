def stock_picker(prices)
  # INITIALIZE VARIABLES TO KEEP TRACK OF MAXIMUM PROFIT AND BEST BUY/SELL DAYS
  max_profit = 0
  best_buy_day = 0
  best_sell_day = 0

  # ITERATE OVER EACH DAY (EXCEPT THE LAST ONE)
  (0...prices.length - 1).each do |buy_day|
    # ITERATE OVER THE FOLLOWING DAYS TO FIND THE BEST SELL DAY
    ((buy_day + 1)...prices.length).each do |sell_day|
      # CALCULATE THE PROFIT FOR THE CURRENT PAIR OF BUY AND SELL DAYS
      profit = prices[sell_day] - prices[buy_day]

      # UPDATE MAX_PROFIT AND BEST BUY/SELL DAYS IF A HIGHER PROFIT IS FOUND
      if profit > max_profit
        max_profit = profit
        best_buy_day = buy_day
        best_sell_day = sell_day
      end
    end
  end

  # RETURN THE PAIR OF DAYS REPRESENTING THE BEST BUY AND SELL DAYS
  return [best_buy_day, best_sell_day]
end

# EXAMPLE USAGE:
result = stock_picker([17,3,6,9,15,8,6,1,10])
puts result.inspect  # OUTPUT: [1, 4] FOR A PROFIT OF $15 - $3 == $12
