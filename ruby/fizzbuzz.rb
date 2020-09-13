class FizzBuzz 
  @@FizzBuzz = {
    3 => "Fizz",
    5 => "Buzz",
  }
  def self.convert(number)
    result = ''
    @@FizzBuzz.keys.each do |k|
      number % k == 0 && result += @@FizzBuzz[k]
    end
    result.length > 0 ? result : number.to_s
  end
end

(1..100).each do |number|
  p FizzBuzz.convert(number)
end
