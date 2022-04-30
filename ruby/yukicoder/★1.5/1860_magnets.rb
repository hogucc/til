# 提出したコード
a, b = gets.split.map(&:to_i)
max_item = [a, b].max
puts a == b ? max_item * 2 : max_item * 2 - 1
