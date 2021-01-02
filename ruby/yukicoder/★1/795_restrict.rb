# 最初はこうやって書いていたけど、yukicoderに提出すると2行目の
# *メソッドをnilに対して実行できると怒られた
n, m = gets.split.map(&:to_i)
puts (n * 100 + m * 10) % 2 == 0 ? "Yes" : "No"

# 最終的には以下のように書いてACになったがgets.to_iを2回実行しているので微妙...
n = gets.to_i
m = gets.to_i
puts (n * 100 + m * 10) % 2 == 0 ? "Yes" : "No"
