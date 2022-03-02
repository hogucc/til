# Hashクラス

## ハッシュ（やキーワード引数の）省略記法

cf. https://techlife.cookpad.com/entry/2021/12/25/220002

Ruby3.1からハッシュやキーワードの省略記法が導入された

```ruby
x = 1
y = 2

# h = { x: x, y: y } と同じ意味
h = { x:, y: }

p h  #=> {:x=>1, :y=>2}
```

キーワード引数も同様

```ruby
def foo(a:)
  p a
end

a = 1

# foo(a: a) と同じ意味
foo(a:)
```

## .new {|hash, key| ... }

空の新しいハッシュを生成し、ブロックの評価結果がデフォルト値になる

設定したデフォルト値は Hash#default_procで参照できる

```ruby
h = Hash.new {|hash, key| hash[key] = 'foo'}

# 値が設定されていない場合は例外を発生させることもできる
h = Hash.new {|hash, key|
  raise(IndexError, "hash[#{key}] has no value")
}
# 値が設定されていないのに参照すると例外が発生する
h[1]
# => hash[1] has no value (IndexError)
```

## .default_proc

ハッシュのデフォルト値を返すProcオブジェクトを返す

ハッシュがブロック形式のデフォルト値を持たない場合はnilを返す

```ruby
h = Hash.new {|hash, key| "The #{key} not exist in #{hash.inspect}"}
p block = h.default_proc # => #<Proc:0x0x401a9ff4>
p block.call({}, :foo) #=> "The foo not exist in {}"
```

## each
each_pairのエイリアスメソッド

hashのブロックパラメーターはArrayで渡される

```ruby
h = {:a=>1}
h.each {|a| p a.class}
# => Array

h = {:a=>1}
h.each_pair {|a| p a.class}

h = {:a=>1, :b=>2}
h.each_pair {|key, value| p [key, value]}
# => [:a, 1]
# [:b, 2]
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

## #to_a

キーと値の2要素の配列を並べた二次元配列を返す

```ruby
h1 = { "a" => 100, 2 => ["some"], :c => "c" }
p h1.to_a
#=> [["a", 100], [2, ["some"]], [:c, "c"]]
```
