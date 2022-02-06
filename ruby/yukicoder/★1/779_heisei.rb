# 1990から2018の間なら平成確定
# 1989年なら1月7以前は平成じゃない
# 2019年5月以降は平成じゃない

# パターンマッチの練習
ymd = gets.chomp.split.map(&:to_i)

case ymd
in [1989, 1, ..7]
  puts 'No'
in [2019, 5.., *]
  puts 'No'
in [1989..2019, *]
  puts 'Yes'
else
  puts 'No'
end

# 普通にDateクラスの範囲指定でよかったかも
require 'date'
puts Date.new(*gets.split.map(&:to_i)).between?(Date.new(1989, 1, 8), Date.new(2019, 4, 30)) ? 'Yes' : 'No'
