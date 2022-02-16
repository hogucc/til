# Arrayクラス

## product

レシーバの配列と引数で与えられた配列から要素を1個ずつとって配列にして返す

```ruby
[1, 2].product([3, 4])
# => [[1, 3], [1, 4], [2, 3], [2, 4]]
```

## each_cons(n)

要素を重複ありでn要素ずつに区切り、ブロックに渡して繰り返す

```ruby
(1..5).each_cons(3){|v| p v }
#=> [1, 2, 3]
# [2, 3, 4]                                                                
# [3, 4, 5]            
```

## each_slice(n)

each_consと似ているが、each_sliceは要素を重複させない

```ruby
(1..5).each_slice(3){|v| p v }
# => [1, 2, 3]
# [4, 5]
```

## compact

selfからnilを取り除いた配列を返す

compact!は破壊的にnilを取り除き、変更された場合はself、そうでなければnilを返す

```ruby
ary = [1, nil, 2, nil, 3, nil]
p ary.compact   #=> [1, 2, 3]
p ary           #=> [1, nil, 2, nil, 3, nil]
ary.compact!
p ary           #=> [1, 2, 3]
p ary.compact!  #=> nil
```

## flatten

selfを再帰的に平坦化する
flatten!の場合、破壊的にselfを変更するが、平坦化が行われない場合はnilを返す

```ruby
a = [1, [2, 3, [4], 5]]
p a.flatten # => [1, 2, 3, 4, 5]
a.flatten! # => [1, 2, 3, 4, 5]
a.flatten! # => nil
```
