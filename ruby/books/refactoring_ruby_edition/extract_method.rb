# メソッド抽出の基本形
def print_owing(amount)
  print_banner
  print_details(amount)
end

def print_details(amount)
  puts "name: #{@name}"
  puts "amount: #{amount}"
end

# メソッド抽出前
def print_owing(amount)
  outstanding = 0.0

  print_banner
  
  # 勘定を計算
  @orders.each do |order|
    outstanding += order.amount
  end

  # 詳細を表示
  puts "name: #{@name}"
  puts "amount: #{amount}" 
end

def print_banner
  # バナーを出力
  puts "**************************"
  puts "*****Customer Owes********"
  puts "**************************"
end
