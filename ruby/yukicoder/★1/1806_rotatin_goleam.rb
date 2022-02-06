# 東西南北
a = gets.chomp.to_sym
b = gets.chomp.to_sym
hougaku = { E: 1, S: 2, W: 3, N: 4}

puts hougaku[b] < hougaku[a] ? hougaku.length - hougaku[a] + hougaku[b] : hougaku[b] - hougaku[a]
