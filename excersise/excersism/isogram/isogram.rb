class Isogram
  def self.isogram?(string)
    chars = string.downcase.scan(/\w/)
    chars.size == chars.uniq.size
  end
end
