# メソッドの挙動確認

## to_i

```ruby
# 整数とみなせない文字があればそこまでを変換対象とする
# コード体系に英字が含まれている場合、安易にto_iするとバグを生み出してしまう
p "z000".to_i # => 0
p "12x00".to_i # => 12
```
