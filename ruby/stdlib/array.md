# Arrayクラス

## #product

レシーバの配列と引数で与えられた配列から要素を1個ずつとって配列にして返す

```ruby
[1, 2].product([3, 4])
# => [[1, 3], [1, 4], [2, 3], [2, 4]]
```

## #each_cons(n)

要素を重複ありでn要素ずつに区切り、ブロックに渡して繰り返す

```ruby
(1..5).each_cons(3){|v| p v }
#=> [1, 2, 3]
# [2, 3, 4]                                                                
# [3, 4, 5]            
```

## #each_slice(n)

each_consと似ているが、each_sliceは要素を重複させない

```ruby
(1..5).each_slice(3){|v| p v }
# => [1, 2, 3]
# [4, 5]
```

## #compact

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

## #flatten

selfを再帰的に平坦化する
flatten!の場合、破壊的にselfを変更するが、平坦化が行われない場合はnilを返す

```ruby
a = [1, [2, 3, [4], 5]]
p a.flatten # => [1, 2, 3, 4, 5]
a.flatten! # => [1, 2, 3, 4, 5]
a.flatten! # => nil
```

## #zip
配列の配列を作成し、返す

```ruby
arr = [1,2].zip([3,4])
p arr
# => [[1, 3], [2, 4]]

p [1,2,3].zip([4,5,6], [7,8])
# => [[1, 4, 7], [2, 5, 8], [3, 6, nil]]
# 数がたりない場合はnil埋めされる
```

## #shift, #unshift

shiftはselfの先頭から1要素を破壊的に取り出す

unshiftはselfの先頭に引数の値を破壊的に追加する

```ruby
1: s = ["one", "two", "three"]
2: s.shift
3: s.shift
4: s.unshift("dummy")

# <実行結果>
# 1: ["one", "two", "three"]
# 2: ["two", "three"]
# 3: ["three"]
# 4: ["dummy", "three"]
```

## #pop, push
pushはselfの末尾に引数の値を破壊的に追加する。appendのエイリアス。

popはselfの末尾から要素を破壊的に取り除いて返す。引数を指定した場合は指定した数分取り除き、それを配列で返す

```ruby
array = [1, 2, 3]
array.push 4
p array
# => [1, 2, 3, 4]
array.pop
p array
# => [1, 2, 3]
array.pop 2
p array
# => [1]
```

## #delete_if

ブロックの評価結果が真になった要素を破壊的に削除する。真になる要素がなくても常にselfを返す

reject!も動きは同じだが、reject!は真になる要素が存在しない場合はnilを返す。ある場合はselfを返す

```ruby
a = [0, 1, 2, 3, 4, 5]
a.delete_if{|x| x % 2 == 0}
p a #=> [1, 3, 5]

a = [1, 3, 5]
a.delete_if{|x| x % 2 == 0}
#=> [1, 3, 5]

a = [1, 3, 5]
a.reject!{|x| x % 2 == 0}
# => nil
```

## #drop(n) -> Array
配列の先頭のn要素を捨てて、残りの要素を配列として返す

```ruby
a = [1, 2, 3, 4, 5, 0]
a.drop(3) # => [4, 5, 0]
# 破壊的変更ではないのでaの値は変化しない
a # => [1, 2, 3, 4, 5, 0]
```

## #drop_while -> Enumerator, drop_while {|element| ... } -> Array

ブロックを評価して最初に偽になった要素の手前まで捨てて、残りの要素を配列として返す

```ruby
a = [1, 2, 3, 4, 5, 0]
a.drop_while {|i| i < 3} # => [3, 4, 5, 0]

# 最初に偽になった要素の手前なので、7の手前で切れる（2は含まれない）
a = [1, 7, 2, 5, 0]
a.drop_while{|i| i < 3} # => [7, 2, 5, 0]
# 破壊的変更ではないのでaの値は変化しない
a # => [1, 7, 2, 5, 0]
```

Railsのコードでも使われている
https://github.com/rails/rails/blob/0d18b43f6ee1ad460cfe7790a79a513438343669/actionpack/lib/action_dispatch/journey/formatter.rb#L105

```ruby
keys_to_keep = route.parts.reverse_each.drop_while { |part|
  !(options.key?(part) || route.scope_options.key?(part)) || (options[part].nil? && recall[part].nil?)
} | route.required_parts
```

## #reverse_each
各要素に対して逆順にブロックを評価する

ブロックが与えられない場合は、自身とreverse_eachから生成したEnumeratorオブジェクトを返す

```ruby
a = ["a", "b", "c"]
a.reverse_each {|x| print x, " "} # => c b a
```

