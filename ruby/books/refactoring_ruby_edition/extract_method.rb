def print_owing(amount)
  print_banner
  # メソッドで使用しているローカル変数を後続の処理でも使う場合は戻り値にして一時変数に代入する
  outstanding = calculate_outstanding
  print_details(outstanding)
end

def print_banner
  puts "**************************"
  puts "*****Customer Owes********"
  puts "**************************"
end

def print_details(outstanding)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end

def calculate_outstanding
  @orders.inject(0.0) { |result, order| result + order.amount }
end
 