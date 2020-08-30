class ResistorColorDuo
  COLOR_MAPPING = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }.freeze

  def self.value(colors)
    colors = colors.shift(2)
    colors.map { |color| COLOR_MAPPING[color] }.join.to_i
  end
end
