## Tell don't Ask

cf.
- https://jabba.cloud/20150912232135
- https://martinfowler.com/bliki/TellDontAsk.html

```ruby
# before
tax = amount.tax
return if tax <= 0
total_amount += tax

# after
# no_tax?メソッドを呼ばずにamountにtotal_amountを算出するメソッドを生やすのでも良さそう
return if amount.no_tax?
total_amount += tax
```

attr_readerとかでインスタンス変数を公開している以下のようにあちこちにロジックが飛び散る危険が出てくる
```ruby
role.can_read = true
role.can_write = false

# 別の場所
role.can_read = true
role.can_write = true

# また別の場所
role.can_read = false
role.can_write = false
```

`:read_only` などの種別のみを他のオブジェクトのメソッドにわたす
細かいロジックは外部に書かずにそのメソッドに委ねると上記のロジックの飛び散りが発生しなくなる
（ `role.can_read = true` や `role.can_write = false` とかしない。 `can_read` や `can_write` ）

```ruby
role.to(:read_only)

role.to(:admin)

role.to(:no_permission)

def to(permission_type)
  case permission_type
  in :read_only
    self.can_read = true
    self.can_write = false
  in :admin
    self.can_read = true
    self.can_write = true
  in :no_permissio
    self.can_read = false
    self.can_write = false 
  end
end

```

## メモ化の弊害

メモ化してbar_totalが各所に散らばるとどこで初期化されているかわかりづらい
https://techracho.bpsinc.jp/hachi8833/2020_06_25/74938

```ruby
class Foo
  def bar_total
    @bar_total ||= bar.total
  end
end
```

インスタンス作るときに初期化すると、あちこちで初期化が発生することを防げる
```ruby
class Foo
  attr_reader :bar_total

  def self.build(bar)
    new(bar.total)
  end

  def initialize(bar_total)
    @bar_total = bar_total
  end
end
```

## Policy Object

ユーザーの役割によって、権限をもつかどうかを判定する
これがないとコントローラーやビューにロジックが染み出してしまう

- https://applis.io/posts/rails-design-patterns#policy%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88
- https://techracho.bpsinc.jp/hachi8833/2018_03_23/53523

### Policy Objectの規則
- メソッド名の末尾は常に `?`
- メソッドはtrueかfalseのいずれかを返す
- 渡された属性は変更しない
- コードはシンプルな読み出しロジックだけを行う:データベース呼び出しなどは行わない

### サンプルコード
https://techracho.bpsinc.jp/hachi8833/2018_03_23/53523の写経

https://github.com/hogucc/policy_object_sample
