h, w = gets.chomp.split.map(&:to_i)
h.times.flat_map { gets.chomp.split.map(&:to_i) }.sort.each_slice(w).map{ puts _1.join(' ')}
