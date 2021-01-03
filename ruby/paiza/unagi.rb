# 未完成
n, m = gets.split.map(&:to_i)
seats = Array.new(n, 0)

m.times do
  people_num, seat_num = gets.split.map(&:to_i)
  s = seat_num - 1
  people_num.times do
      next if seats[s] == 1
      seats[s] = 1
      s += 1
      s = 0 if seats.size <= s
  end
end

puts seats.select{ |s| s == 1 }.count
