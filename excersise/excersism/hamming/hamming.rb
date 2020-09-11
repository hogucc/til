class Hamming
  def self.compute(text_a, text_b)
    raise ArgumentError if text_a.size != text_b.size
    text_a.chars.zip(text_b.chars).count{ |a,b| a != b }
  end
end
