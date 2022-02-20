# ActiveRecord::Relation
## load_async

非同期でクエリを実行できる

load_asyncはデフォルトでは無効だが、`config.active_record.async_query_executor` に `:global_thread_pool`または `:multi_thread_pool`を指定する

`:global_thread_pool` はアプリケーション単位で1つのスレッドプールが用意される

`:multi_thread_pool` はデータベース単位でスレッドプールが使用される。プールサイズはdatabase.ymlで構成できる。複数データベースを運用するときに使用すると良さそう

cf. [Configuring Rails Applications — Ruby on Rails Guides](https://guides.rubyonrails.org/configuring.html#config-active-record-async-query-executor)

https://twitter.com/websebdev/status/1495051632597475333 の使用例のように、コントローラーの1アクション内で並列でクエリを実行する場合に、速度改善につながりそう？
