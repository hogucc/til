class Clock
  def initialize(hour: 0, minute: 0)
    @minutes_total = hour * 60 + minute
  end

  def hours
    minutes_total / 60 % 24
  end

  def minutes
    minutes_total % 60
  end

  def to_s
    format '%02d:%02d', hours, minutes
  end

  def +(other)
    Clock.new(hour: hours + other.hours, minute: minutes + other.minutes)
  end

  def -(other)
    Clock.new(hour: hours - other.hours, minute: minutes - other.minutes)
  end

  def ==(other)
    other.class == self.class &&
      hours == other.hours &&
      minutes == other.minutes
  end

  private
    attr_reader :minutes_total
end
