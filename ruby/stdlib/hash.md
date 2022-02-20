# Hashクラス

## each
each_pairのエイリアスメソッド

hashのブロックパラメーターはArrayで渡される

```ruby
h = {:a=>1}
h.each {|a| p a.class}
# => Array

h = {:a=>1}
h.each_pair {|a| p a.class}
```

## invert
キーと値を入れ替えて新しいHashを作る（非破壊的）

```ruby
h = {a: 100, b: 200}
p h.invert # => => {100=>:a, 200=>:b}
```

## step(limit, step=1)

stepを足しながらlimitを超えるまでブロックを繰り返す

```ruby
2.step(5, 1){|n| p n}
2
3
4
5

# stepに負の数が指定された場合は下限扱いになる
10.step(6, -1){|n| p n}
10
9
8
7
6
```

## values
ハッシュの全値を返す。引数は取らない

```ruby
hash = {price: 100, order_code: 200, order_date: "2018/09/20", 
tax: 0.8}
p hash.values
# => [100, 200, "2018/09/20", 0.8]
```

## values_at

引数で指定されたキーに対応する配列を返す

```ruby
hash = {price: 100, order_code: 200, order_date: "2018/09/20", tax: 0.8}
p hash.values_at(:price, :tax) 
# => [100, 0.8]
```

## fetch

```ruby
hash = {price: 100, order_code: 200, order_date: "2018/09/20", 
tax: 0.8}
p hash.fetch(:price) # => 100
# 該当する値がなく、引数defaultが与えられていればその値を返す
p hash.fetch(:hoge, 'fuga') # => "fuga"
# ブロックが与えられている場合はブロックを評価した値を返す
p hash.fetch(:hoge){|key| "#{key} is not exist"}
# => "hoge is not exist"
```

## reject

selfを複製してブロックを評価した値が真になる要素を削除したハッシュを返す（非破壊的な変更）

```ruby
h = { 2 =>"8" ,4 =>"6" ,6 =>"4" ,8 =>"2" }

p h.reject{|key, value| key.to_i < value.to_i} #=> {6=>"4", 8=>"2"}
p h
# => {2=>"8", 4=>"6", 6=>"4", 8=>"2"}
```
