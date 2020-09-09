class Phrase
  def initialize(word)
    @word = word.split(/[\s\n,.:!&@$%^]/).reject(&:empty?).map do |str|
      str.downcase.gsub(/^\'|\'$/, "")
    end
  end

  def word_count
    @word.group_by(&:itself).map{ |key, value| [key, value.count] }.to_h
  end
end

