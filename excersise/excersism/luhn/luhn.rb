class Luhn
  def self.valid?(str)
    return false if str.length <= 1

    array = []
    str.strip.split(" ").map do |str|
      str.reverse.each_char.with_index.map do |c, index|
        # TODO 数字以外ならfalseにする
        c = c.to_i
        c = c * 2 if (index + 1) % 2 == 0
        c = c - 9 if c > 9
        p c
        array << c
      end
    end

    p array.sum

    return false if array.sum % 10 != 0

    true
  end
end
