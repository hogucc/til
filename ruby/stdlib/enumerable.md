# Enumerableクラス

## #any?

すべての要素が偽である場合にfalseを返す

```ruby
$val = 0

class Count
  def self.up
    $val = $val + 1
    $val == 3 ? true : false
  end
end

[*1..10].any? do
  Count.up
end

p $val
# => 3
```

## #partition
条件を満たす要素と満たさない要素に分割して、二次元配列にして返す

```ruby
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0].partition {|i| i % 3 == 0 }
 #=> [[9, 6, 3, 0], [10, 8, 7, 5, 4, 2, 1]]
```

## #take_while

Enumberableオブジェクトの要素が偽になるまで、ブロックを評価する

最初に偽になった要素の手前の要素までを配列として返す

```ruby
e = [1, 2, 3, 4, 5, 0].each
e.take_while{|i| i < 3} # => [1, 2]
```
