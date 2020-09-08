class Series
  def initialize(str)
    @str = str.chars
  end

  def slices(num)
    raise ArgumentError if @str.length < num
    slice_str = @str.each_with_index.map do |c, idx|
      @str[idx...(idx + num)].join
    end

    slice_str.delete_if {|str| str.length < num}
  end
end

