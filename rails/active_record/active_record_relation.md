# ActiveRecord::Relation
## load_async

非同期でクエリを実行できる

load_asyncはデフォルトでは無効だが、`config.active_record.async_query_executor` に `:global_thread_pool`または `:multi_thread_pool`を指定する

`:global_thread_pool` はアプリケーション単位で1つのスレッドプールが用意される

`:multi_thread_pool` はデータベース単位でスレッドプールが使用される。プールサイズはdatabase.ymlで構成できる。複数データベースを運用するときに使用すると良さそう

cf. [Configuring Rails Applications — Ruby on Rails Guides](https://guides.rubyonrails.org/configuring.html#config-active-record-async-query-executor)

https://twitter.com/websebdev/status/1495051632597475333 の使用例のように、コントローラーの1アクション内で並列でクエリを実行する場合に、速度改善につながりそう？

## merge(other, *rest)

https://api.rubyonrails.org/classes/ActiveRecord/SpawnMethods.html#method-i-merge　から引用

```ruby
Post.where(published: true).joins(:comments).merge( Comment.where(spam: false) )
# Performs a single join query with both where conditions.

recent_posts = Post.order('created_at DESC').first(5)
Post.where(published: true).merge(recent_posts)
# Returns the intersection of all published posts with the 5 most recently created posts.
# (This is just an example. You'd probably want to do this with a single query!)

Post.where(published: true).merge(-> { joins(:comments) })
# => Post.where(published: true).joins(:comments)
```

mergeを使うと、`user.items`の後に、Userモデルの条件をつなげることができる

`user.items.merge(User.where(name: "hoge"))`

※以下のようにmergeを使わずに指定すると、nameはUserではなくItemのものが検索される

`user.items.where(name: "hoge").to_sql`
#=> "SELECT "items".* FROM "items" WHERE "items"."user_id" = 1 AND "items"."name" = 'hoge'"
