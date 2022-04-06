# ActiveRecordクエリインターフェイス

# selectとpluckの違い

どちらもテーブルの特定のカラムを取得したいときに使う
selectはARオブジェクトが返るが、pluckは配列が返る

# limit

基本的には引数に取りたい件数を指定する

nilを指定すると全件取得と同じ動きをする

たとえば、全部で10件Usersテーブルにレコードがあるとしたら以下のような動きになる

```ruby
# Usersテーブルのレコードは全部で10件
User.all.count
=> 10

User.limit(2).count
=> 2

User.limit(nil).count
=> 10
```

## where.firstとfind_byの違い

https://techracho.bpsinc.jp/hachi8833/2022_04_05/116823

where.firstには暗黙のorderスコープが隠れている

```ruby
User.where(email: "andy@goodscary.com").first
# SELECT "users".*
# FROM "users"
# WHERE "users"."email" = "andy@goodscary.com"
# ORDER BY "users"."id" ASC
# LIMIT 1
```

find_byはorderは指定されない

```ruby
User.find_by(email: "andy@goodscary.com")
# SELECT "users".*
# FROM "users"
# WHERE "users"."email" = "andy@goodscary.com"
# LIMIT 1
```

where.firstの場合、ソート順を確定するためにインデックスを用いないスキャンが意図せず発生し、パフォーマンスが大きく低下する
