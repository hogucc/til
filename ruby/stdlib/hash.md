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
