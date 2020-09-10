class Hamming
  def self.compute(text_a, text_b)
    raise ArgumentError if text_a.size != text_b.size

    text_size = text_a.size
    diff_num = 0

    if text_a == text_b
      0
    else
      (0...text_size).each do |size|
        diff_num += 1 if text_a[size] != text_b[size]
      end

      diff_num
    end
  end
end
