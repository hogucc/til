# frozen_string_literal: true

def max_profit(prices)
  min_price = prices[0]
  profit = 0
  (1..prices.length-1).each do |idx|
    profit = prices[idx] - min_price if profit < prices[idx] - min_price
    min_price = prices[idx] if prices[idx] < min_price
  end
  profit
end
