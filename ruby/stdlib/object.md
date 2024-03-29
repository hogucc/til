# Objectクラス
## tap

```ruby
tap {|x| ... } -> self
```
cf. https://docs.ruby-lang.org/ja/latest/method/Object/i/tap.html

> selfを引数としてブロックを評価し、selfを返す

## then

```ruby
then {|x| ... } -> object
then -> Enumerator
```

cf. https://docs.ruby-lang.org/ja/latest/method/Object/i/yield_self.html

> selfを引数としてブロックを評価し、ブロックの結果を返します。

`yield_self` のエイリアス

### tapとthenの違い
実行内容はselfを引数としたブロックの評価だが、戻り値が異なる

tapはself、thenはブロックの結果を返す

Array#each、Array#mapの関係に似ている（tapがeachでthenがmap）

## is_a?

cf. https://docs.ruby-lang.org/ja/latest/method/Object/i/is_a=3f.html

`kind_of?` のエイリアスメソッド

レシーバーのオブジェクトが引数で指定されたクラスかそのサブクラスのインスタンスであるときに真を返す

```ruby
# relationがActiveRecord::Relationのインスタンスであれば真
relation.is_a?(ActiveRecord::Relation)
```

## equal?

同一のオブジェクトの場合にtrueを返す

```ruby
a1 = "abc"
a2 = 'abc'

print a1.equal? a2
# string#eql?は同じ文字列ならtrueを返す
print a1.eql? a2
# => falsetrue
```
