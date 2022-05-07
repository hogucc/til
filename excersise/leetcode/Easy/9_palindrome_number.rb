# 引数が回文かどうかを判定する（引数で渡されるのは数値）

# 引数を文字列に変換するパターン
# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  reverse_x = x.to_s.reverse
  x.to_s == reverse_x
end

# 引数をStringに変換なしで処理する方法
def is_palindrome(x)
  return false if x < 0
  # digitsは1の位から取り出す（引数xとは逆順になる）
  x.digits.join.to_i == x
end
