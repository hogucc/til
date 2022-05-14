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
