cf. [Active Job の基礎 - Railsガイド](https://railsguides.jp/active_job_basics.html)

## ジョブとは
定期的なクリーンアップを始め、メール送信や請求書発行など、あらゆる処理がジョブになる

## ActiveJobとは
キューイングバックエンド（SidekiqとかDelayed Jobとか）ごとの差異を吸収するためにジョブ管理の共通インターフェースを提供する

- ActiveJobではAdapterパターンが使用されている
  - https://morizyun.github.io/ruby/design-pattern-adapter.html
  - `rails/activejob/lib/active_job/queue_adapters` 配下に各キューイングバックエンドごとのenqueue(ジョブの登録)、perform（ジョブの実行）が定義されている
  - `config/application.rb` にqueue_adapterの指定をしておけば、指定したキューイングバックエンドが使用できるようになる
    - queue_adapterをセットしている箇所
      - https://github.com/rails/rails/blob/18707ab17fa492eb25ad2e8f9818a320dc20b823/activejob/lib/active_job/queue_adapter.rb#L37
      - enqueueメソッドはqueue_adapterをレシーバーにして呼び出されている
      - queue_adapterの取得は `queue_adapter=` メソッドで行われており、 `ActiveJob::QueueAdapters.lookup` で取得したキューイングバックエンドのクラスをnewしている
```config/application.rb
config.active_job.queue_adapter = :sidekiq
```

## Active Jobでサポートされる型
cf. [Active Job の基礎 - Railsガイド](https://railsguides.jp/active_job_basics.html#%E5%BC%95%E6%95%B0%E3%81%A7%E3%82%B5%E3%83%9D%E3%83%BC%E3%83%88%E3%81%95%E3%82%8C%E3%82%8B%E5%9E%8B)

> 基本型（NilClass、String、Integer、Float、BigDecimal、TrueClass、FalseClass）
Symbol
Date
Time
DateTime
ActiveSupport::TimeWithZone
ActiveSupport::Duration
Hash（キーの型はStringかSymbolにすべき）
ActiveSupport::HashWithIndifferentAccess
Array

上記の型がサポートされている
上記の型に加えて、Railsが裏でデシリアライズしてくれるので、Active Recordオブジェクトも渡せる
ただし、上記以外に自作したクラスを引数で渡す場合は自分でシリアライザを定義する必要がある
