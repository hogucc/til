# Enumeratorクラス

## Enumeratorを使うメリット

イテレータとしての役割だけならArrayでも十分だが、Enumeratorには以下のメリットがある

cf. [Ruby の Enumerator とたわむれる | Money Forward Engineers' Blog](https://moneyforward.com/engineers_blog/2020/02/04/ruby-enumerator/)

- 遅延評価
  - `Enumerator.new` で新たにイテレータを作った時点ではまだメモリに展開はされていない
  - 要素が参照されたときに初めてメモリに参照された分だけ展開される
  - なので、長さの長いコレクションを生成して一部参照するときはメモリを無駄に消費しなくてよさそう
  - この記事に載っている使用例がわかりやすかった
    - https://magazine.rubyist.net/articles/0041/0041-200Special-lazy.html
    - Twitterのタイムラインみたいな終わりのわからない列を扱うときに使えそう
    - 終わりがわからない列に対して何かの条件でselectしたいときは[Enumerator::Lazy](https://docs.ruby-lang.org/ja/latest/class/Enumerator=3a=3aLazy.html)を使って、遅延評価でメソッドチェーンさせる

## Enumeratorの作り方

```ruby
e = Enumerator.new  do |yielder|
  # yielderにコレクションの中身を追加
  yielder << 'hoge'
  yielder << 'fuga'
  yielder << 'piyo'
end

e.each{|i| p i}
# => "hoge"
# => "fuga"
# => "piyo"
=> #<Enumerator::Yielder:0x00007ff19d322a30>
```
