# 委譲

サンプルコード

```ruby
def foo
  @foo ||= # ややこしい処理
end

class Bar
  def bar(obj)
    # 渡されたobjのメソッドbarに処理を委譲している
    obj.bar
  end
end
```

Rubyの場合、標準ライブラリのForwardableを利用した書き方もある

https://docs.ruby-lang.org/ja/latest/class/Forwardable.html

```ruby
require 'forwardable'
class MyQueue
  extend Forwardable
  attr_reader :queue
  def initialize
    @queue = []
  end

  def_delegator :@queue, :push, :mypush
end

q = MyQueue.new
q.mypush 42
q.queue    # => [42]
q.push 23  # => NoMethodError
```

Railsの場合、以下のことを

```ruby
class User < ApplicationRecord
  has_one :profile
end

class User < ApplicationRecord
  has_one :profile

  def name
    profile.name
  end
end
```

delegateを使えば1行でできる

```ruby
class User < ApplicationRecord
  has_one :profile

  delegate :name, to: :profile
end
```
