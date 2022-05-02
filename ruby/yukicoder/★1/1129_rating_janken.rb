# ひとまず愚直に実装
class RockPaperScissors
  ROCK = 0
  Scissor = 1
  Paper = 2

  COMPATIBLE_TABLE = {ROCK => Scissor, Scissor => Paper, Paper => ROCK}

  def self.win?(player_hand, rival_hand)
    return false if COMPATIBLE_TABLE[player_hand] != rival_hand
    true
  end

  def self.winner
    a, b, c, d = gets.split.map(&:to_i)

    if a != c
      if a > c
        'null'
      else
        'tRue'
      end
    elsif b != d
      if self.win?(b, d)
        'null'
      else
        'tRue'
      end
    else
      'Draw'
    end
  end
end

puts RockPaperScissors.winner
