class Scrabble
  score_to_letter = {
    1  => [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ],
    2  => [ 'D', 'G' ],
    3  => [ 'B', 'C', 'M', 'P' ],
    4  => [ 'F', 'H', 'V', 'W', 'Y' ],
    5  => [ 'K' ],
    8  => [ 'J', 'X' ],
    10 => [ 'Q', 'Z' ]
  }
  
  letter_to_score = Hash.new
  score_to_letter.each_pair { |k,v| v.each { |x| letter_to_score[x] = k } }

  def initialize(str)
    @str = str.to_s.upcase
  end
  
  def score
    score = 0
    score_to_letter.each do |key, value|
      score += (@str.scan(key).count * value)
    end
    score
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
