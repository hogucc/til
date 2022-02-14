# Structクラス

## new

cf.https://docs.ruby-lang.org/ja/latest/method/Struct/s/=5b=5d.html

- 引数に`keyword_init: true`を指定した場合
  - キーワード引数で初期化できるようになる

```ruby
User = Struct.new(:name, :email, :birthday, keyword_init: true)
User.new(name: 'hoge', email: 'hoge@example.com', birthday: '20010208')
# 上記の引数の順番は自由
# User.new(name: 'hoge', birthday: '20010208', email: 'hoge@example.com')でもOK

# keyword_initを指定しなかったらこのようになるが、
# 引数が指しているものがわかりづらいし、指定する順番を間違えても気づけない
User = Struct.new(:name, :email, :birthday)
User.new('hoge', 'hoge@example.com', '20010208')
```
