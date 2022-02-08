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
