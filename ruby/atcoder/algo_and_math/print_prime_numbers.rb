# N以下の素数を小さい順に出力
# before(128ms)
n = gets.chomp.to_i
prime_num_ary = (1..n).map do |num|
  next if num == 1
  
  is_prime_num = false
  (2..n).each do |divide_num|
    if (divide_num != num) && (num % divide_num == 0)
      is_prime_num = true
      break
    end
  end
  
  num unless is_prime_num
end

# after(64ms) 速度改善ver
n = gets.chomp.to_i
prime_num_ary = (1..n).map do |num|
  next if num == 1
  
  is_prime_num = false
  # √nまで割り切れなければ素数と言えるのでnまでループを回す必要ない
  (2..Math.sqrt(n)).each do |divide_num|
    if (divide_num != num) && (num % divide_num == 0)
      is_prime_num = true
      break
    end
  end
  
  num unless is_prime_num
end
puts prime_num_ary.compact.join(' ')
