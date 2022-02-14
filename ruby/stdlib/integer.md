# Integerクラス

## x進数のプレフィックス

- 2進数： `0b`
- 8進数： `0` または `0o`
- 10進数： `0d`
- 16進数： `0x`

以下のように、プレフィックスと合わない数値は例外が発生する

```ruby
puts 0b2
# => numeric literal without digits (SyntaxError)
```
