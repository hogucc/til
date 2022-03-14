# 変数

## クラス変数

クラス変数は継承されたクラスにも反映される

以下のコードだとFooクラスの子クラスであるBarでも `@@var` が共有されるので、 `foo.var` や `bar.var` ともに3になる

```ruby
class Foo
  @@var = 0

  def var
    @@var
  end

  def var=(value) 
    @@var = value
  end
end

class Bar < Foo
end

foo = Foo.new
foo.var += 1
bar = Bar.new
bar.var += 2

puts "#{foo.var}/#{bar.var}"
# => "3/3"
```

