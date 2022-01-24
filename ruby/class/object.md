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

## tapとthenの違い
実行内容はselfを引数としたブロックの評価だが、戻り値が異なる

tapはself、thenはブロックの結果を返す

Array#each、Array#mapの関係に似ている（tapがeachでthenがmap）


