class Luhn
  attr_reader :string

  def initialize(string)
    @string = string.strip.delete(' ').reverse
  end

  def check_string
    !string.match?(/\D/) && string.length > 1
  end

  def calculate_luhn
    luhn_string = string.scan(/\d/).map(&:to_i)
    sum = 0
    luhn_string.each_with_index do |num, index|
      sum += index.even? ? num : double_number(num)
    end
    sum % 10 == 0
  end

  def double_number(number)
    double_number = number * 2
    double_number > 9 ? double_number -9 : double_number
  end

  def check_luhn
    check_string && calculate_luhn
  end

  def self.valid?(string)
    Luhn.new(string).check_luhn
  end
end
