# バリデーションヘルパー

## inclusion

指定の値が属性の値に含まれているかどうかをバリデーションする

https://railsguides.jp/active_record_validations.html#inclusion

以下、Railsガイドから引用

```ruby
class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large), message: "%{value} のサイズは無効です" }
end
```

## exclusion

指定の値が属性の値に含まれていないことを確認する

https://railsguides.jp/active_record_validations.html#exclusion

以下、Railsガイドから引用

```ruby
class Account < ApplicationRecord
  validates :subdomain, exclusion: { in: %w(www us ca jp),
                                     message: "%{value}は予約済みです" }
end
```
