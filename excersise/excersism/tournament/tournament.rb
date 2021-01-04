class Tournament
  def self.tally(input)
    if input.chomp.empty?
      expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      TALLY
    end
  end
end
