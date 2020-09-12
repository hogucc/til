class Raindrops
  @@Drops = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }
  def self.convert(number)
    result = ''
    @@Drops.keys.each do |k|
      number % k == 0 && result += @@Drops[k]
    end
    result.length > 0 ? result : number.to_s
  end
end
