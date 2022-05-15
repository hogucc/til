# Vの前がIだと4
# Xの前がIだと9
# Lの前がXだと40
# Cの前がXだと90
# Dの前がCだと400
# Mの前がCだと900

# この内容で一応ACしたけどなんかかっこわるい...
ROMAN_NUM = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  s.each_char.map.with_index do |str, i|
    next ROMAN_NUM[str] if i == 0
    case [i, s[i - 1], str]
    in ["I", "V" | "X"] | ["X", "L" | "C"] | ["C", "D" | "M"]
      (ROMAN_NUM[str]) - ROMAN_NUM[s[i - 1]] * 2
    else
      ROMAN_NUM[str]
    end
  end.sum
end

# 他の人が書いたコード
# if文で次のローマ数字が今のローマ数字より大きければtempという一時変数に入れてresには加算しない
# 次のループでtempに入れた数を引くようにしている
# たしかにこれだとすっきり書けてよさそう
ROM_NUMS = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000
}

def roman_to_int(s)
  res = 0
  temp = 0
  s.chars.each_with_index do |el, i|
    if ROM_NUMS[s[i + 1]] && ROM_NUMS[el] < ROM_NUMS[s[i+1]]
      temp = ROM_NUMS[el]
    else
      res += (ROM_NUMS[el] - temp)
      temp = 0
    end
  end
  res
end
