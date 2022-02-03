# Model

## table_name

RailsではUserというモデルがある場合、自動的にusersというテーブルを参照する

仮にその法則を逸脱して、別のテーブル名にしたい場合はモデルに以下のように定義する

```ruby
class User < ApplicationRecord
  self.table_name = 'myuser'
end
```

cf. https://edgeapi.rubyonrails.org/classes/ActiveRecord/ModelSchema/ClassMethods.html#method-i-table_name
