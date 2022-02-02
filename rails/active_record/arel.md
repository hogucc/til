# Arel

https://github.com/rails/arel

https://rubygems.org/gems/arel

> Arel Really Exasperates Logicians Arel is a SQL AST manager for Ruby. It 1. Simplifies the generation of complex SQL queries 2. Adapts to various RDBMSes It is intended to be a framework framework; that is, you can build your own ORM with it, focusing on innovative object and collection modeling as opposed to database compatibility and query generation.

上記のrubygemsの記載によれば、Arelは

1. 複雑なSQLクエリの生成を簡略化する

2. 様々なRDBMSに適応する

## 使わないほうが良い理由

こちらの記事に使わないほうが良い理由が書かれている

[Arelでクエリを書くのはやめた方が良い5つの理由 - Qiita](https://qiita.com/jnchito/items/630b9f038c87298b5756)

Arelはprivate
https://github.com/rails/arel/issues/368#issuecomment-145351968

> The use of Arel from Active Record is not supported. It is an internal, private API.

Arelはprivate APIで、サポートしないよと書かれている

なので、バージョンアップで動かなくなる可能性がある

そもそも素直にSQLを書けばArelを使わずに済むので、上記のリスクがある状態で使い続けるメリットはなさげ
