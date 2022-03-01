# Class

# .new

引数で渡されたスーパークラスのサブクラスを生成する

```ruby
# ブロックが与えられた場合は、生成したクラスを引数として、クラスのコンテキストでブロックを実行する

klass = Class.new(superclass) do ||
  def hoge
    p 'hoge'
  end
end

```
