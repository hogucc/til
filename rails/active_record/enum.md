# ActiveRecord::Enum

cf. https://api.rubyonrails.org/classes/ActiveRecord/Enum.html#method-i-enum

## デフォルト値の設定
以下のように、defaultオプションを指定する
```ruby
class Conversation < ActiveRecord::Base
  enum :status, [ :active, :archived ], default: :active
end
```

ハッシュ構文だとこんなかんじ

```ruby
class Conversation < ActiveRecord::Base
  enum :status, { active: 1, archived: 0 }, default: :active
end
```

## ハッシュ構文
Rails7からはenumのオプションのprefixとして `_` を書かなくて済むように、以下の記法に変わった

変更前
```ruby
class Book < ActiveRecord::Base
  enum status: [ :proposed, :written ], _prefix: true, _scopes: false
  enum cover: [ :hard, :soft ], _suffix: true, _default: :hard
end
```

変更後

```ruby
class Book < ActiveRecord::Base
  enum :status, [ :proposed, :written ], prefix: true, scopes: false
  enum :cover, [ :hard, :soft ], suffix: true, default: :hard
end
```

ハッシュの場合は以下のように書く
```ruby
class Post < ActiveRecord::Base
  enum :status, { draft: 0, published: 1, archived: 2 }, prefix: true, scopes: false
  enum :category, { free: 0, premium: 1 }, suffix: true, default: :free
end
```

cf. https://github.com/rails/rails/pull/41328

cf. https://techracho.bpsinc.jp/hachi8833/2021_06_17/105107
