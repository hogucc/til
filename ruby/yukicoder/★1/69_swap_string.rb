# 提出したコード
str = readlines.map(&:chars).map(&:sort)
puts str[0] == str[1] ? "YES" : "NO"

# 他の方の提出コード
# inject使えば1行で書けたのかー
puts [gets, gets].map(&:chars).map(&:sort).inject(:==) ? "YES" : "NO"
