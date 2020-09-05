class Matrix
  def initialize(matrix_num)
    @matrix_num = matrix_num
  end

  def rows
    @matrix_num.split("\n").map {|row| row.split(" ").map(&:to_i)}
  end
end
