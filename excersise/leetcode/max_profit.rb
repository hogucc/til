# frozen_string_literal: true

def max_profit(prices)
  min_idx = 0
  max_profit = 0
  prices.each_with_index do |price, idx|
    if price < prices[min_idx]
      min_idx = idx
      max_profit = max_profit + prices[min_idx] - price
    elsif max_profit < price - prices[min_idx]
      max_profit = price - prices[min_idx]
    end
  end
  max_profit
end
