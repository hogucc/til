class Luhn
  def self.valid?(str)
    array = []
    str = str.strip.delete(" ").reverse
    return false if str.length <= 1
    return false unless /\A[0-9]+\z/.match?(str)
    str.each_char.with_index.map do |c, index|
      c = c.to_i
      c = c * 2 if (index + 1) % 2 == 0
      c = c - 9 if c > 9
      array << c
    end

    return false if array.sum % 10 != 0

    true
  end
end
