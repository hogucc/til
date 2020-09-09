class Phrase
  attr_accessor :word
  def initialize(word)
    self.word = word
  end

  def word_count
    words.tally
  end

  private
    def words
      word.downcase.scan(/\b[\w\']+\b/)
    end
end

