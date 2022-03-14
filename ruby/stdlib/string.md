# Stringクラス

https://docs.ruby-lang.org/ja/latest/class/String.html

## to_i

```ruby
# 整数とみなせない文字があればそこまでを変換対象とする
# コード体系に英字が含まれている場合、安易にto_iするとバグを生み出してしまう
p "z000".to_i # => 0
p "12x00".to_i # => 12
```

次のように引数に基数を指定すると、10進数に変換される

```ruby
# 2進数から10進数に変換
puts '0b11'.to_i(2) # => 3
```

引数に0を指定すると、プレフィックスから基数を判断して変換される

```ruby
puts '0b11'.to_i(0) # => 3
```

## length

sizeのエイリアスメソッド

```ruby
# サロゲートペア文字でもちゃんと1文字として扱われていた
"𩸽".length
=> 1
# バイト数は4だった
"𩸽".bytesize
=> 4
# マルチバイト文字もちゃんと1文字で扱われている
"いろは".length
=> 3
```

## oct

文字列を8進数文字列とみなして、整数に変換する

```ruby
puts '0o11'.oct # => 9
puts '123'.oct # => 83

# プレフィックスが8進数以外のときは8進数以外の変換も行う
puts '0b11'.oct # => 3
```

## [nth, len]
slice(nth, len)のエイリアスメソッド

nth文字目からlen文字分を取得し、新しい文字列として返す

```ruby
str0 = "bar"
str0[2, 1] # => 'r'
puts str0
# => bar
# 非破壊的
```

## concat
<<のエイリアスメソッド
文字列を破壊的に連結する

```ruby
def hoge(n)
  if n % 3 == 0
    "hello"
  elsif n % 5 == 0
    "world"
  end
end

str = ''
str.concat hoge(3)
str.concat hoge(5)

puts str
# => helloworld
```

## strip

文字列の先頭と末尾の空白文字（`\t\r\n\f\v`）を取り除く

## strip!

文字列の先頭と末尾の空白文字（`\t\r\n\f\v`）を破壊的に取り除く

## chomp
末尾から改行コードを削除する

## chop
末尾の文字を取り除く。ただし、文字列の末尾が `"\r\n"` であれば2文字とも取り除く

## eql?
同じ文字列の場合はtrueを返す。オブジェクトIDが異なっていても、同じ文字列ならtrueを返す

基本的に `String#==(other)` と同じ結果を返す

が、otherが文字列以外の場合は `other.to_s` の結果と比較される

```ruby
a1 = "abc"
a2 = 'abc'

print a1.eql? a2
print a1 == a2
# => truetrue
```

# casecmp

アルファベットの大文字小文字の違いを無視して、文字列の順序を比較する
同じ文字列の場合は0、selfが大きいときは1、小さいときは-1を返す

```ruby
p "stringaa".casecmp("stringAA")
=> 0
```

`String#<=>` はアルファベットの大文字小文字を区別する

```ruby
p "stringaa" <=> "stringAA"
=> 1                      
```

## self =~ other
正規表現otherとマッチを行う

マッチしなければnil、マッチしたら、マッチしたインデックス位置を返す

```ruby
p "string" =~ /str/   # => 0
p "string" =~ /not/   # => nil
p "abcfoo" =~ /foo/   # => 3
```

## #index(pattern, pos)
文字列のpos番目からpatternを検索し、最初に見つかった位置を返す

見つからなければnilを返す

```ruby
p "astrochemistry".index("str")         # => 1
p "regexpindex".index(/e.*x/, 2)        # => 3
p "character".index(?c)                 # => 0

p "foobarfoobar".index("bar", 6)        # => 9
p "foobarfoobar".index("bar", -6)       # => 9
```

