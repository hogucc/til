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

    return 'null' if a > c
    return 'tRue' if a < c
    return 'Draw' if b == d
    return 'null' if self.win?(b, d)
    'tRue'
  end
end

puts RockPaperScissors.winner
