class Isogram
  def self.isogram?(input)
    hash = input.chars.tally.select {|key, value| value >= 2}
    if hash.length >= 1
      p "Expected false, '#{input}' is not an isogram"
    else
      p "Expected true, '#{input}' is an isogram"
    end
  end
end
