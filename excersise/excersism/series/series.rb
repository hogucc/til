class Series
  def initialize(str)
    @str = str.chars
  end

  def slices(num)
    raise ArgumentError if @str.length < num
    @str.each_cons(num).map(&:join)
  end
end
