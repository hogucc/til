# Enumerableクラス

## any?

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
