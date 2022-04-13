# パターンマッチ

- パターンマッチはパターンにマッチしなければ例外が起きる

```ruby
def hoge_with(type)
  case type
  in :c then with_c
  in :d then with_d_and_e
  end
end

hoge_with(:P)
# => (irb):2:in `hoge_with': P (NoMatchingPatternError)
```

また、パターンマッチにすることで想定されるユースケースがわかりやすくなる

```ruby
# こちらがパターンマッチを使わずにif文で書いたコード
def hoge_with(time)
  time = Time.zone.prev_month if time

  time.begining_of_month
end

# 上のコードをパターンマッチで書くとこんなかんじ。ユースケースがわかりやすい
def hoge_with(type)
  case type
  in :current then Time.current.begining_of_month
  in :blank   then Time.zone.prev_month.begining_of_month
end
```

呼び出す側もケースが明示され、Time.zoneなどのTimeクラスを渡さなくてよくなるので、メソッドの実装に依存しない
