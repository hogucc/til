class Acronym
  def self.abbreviate(string)
    string.split(/\s+|-/).map { |char| char[0]}.join.upcase
  end
end
