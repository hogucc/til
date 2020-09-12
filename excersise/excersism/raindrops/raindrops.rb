class Raindrops
  def self.convert(num)
    text = ""
    text = "Pling" if num % 3 == 0
    text += "Plang" if num % 5 == 0
    text += "Plong" if num % 7 == 0
    text = num.to_s if text.nil?

    text
  end
end
