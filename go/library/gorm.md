# GORM

Go言語のORMライブラリ

```go
import (
    "gorm.io/gorm"
)

type Product struct {
  gorm.Model
  Code  string
  Price uint
}
```

## CRUD
### レコードを作成する

https://gorm.io/ja_JP/docs/create.html から引用

```go
user := User{Name: "Jinzhu", Age: 18, Birthday: time.Now()}

result := db.Create(&user) // 作成したデータのポインタを渡す

user.ID
result.Error
result.RowsAffected

// フィールドを選択してレコードを作成する
db.Select("Name", "Age", "CreatedAt").Create(&user)
// INSERT INTO `users` (`name`,`age`,`created_at`) VALUES ("jinzhu", 18, "2020-07-04 11:05:21.775")

// 省略する項目を指定し、レコードを作成する
db.Omit("Name", "Age", "CreatedAt").Create(&user)
// // INSERT INTO `users` (`birthday`,`updated_at`) VALUES ("2020-01-01 00:00:00.000", "2020-07-04 11:05:21.775"
```

### 一括作成

スライスをCreateメソッドに渡す

```go
var users = []User{{Name: "jinzhu1"}, {Name: "jinzhu2"}, {Name: "jinzhu3"}}
db.Create(&users)

for _, user := range users {
user.ID // 1,2,3
}
```

### Mapを使って作成

map[string]interface{} と []map[string]interface{}{}を使ってレコード作成できる

```go
db.Model(&User{}).Create(map[string]interface{}{
  "Name": "jinzhu", "Age": 18,
})

// batch insert from `[]map[string]interface{}{}`
db.Model(&User{}).Create([]map[string]interface{}{
  {"Name": "jinzhu_1", "Age": 18},
  {"Name": "jinzhu_2", "Age": 20},
})
```

### 関連データと関連付けて作成する

関連データがゼロ値でなければ関連データもupsertされる
その際、関連データのHooksメソッドも実行される

```go
type CreditCard struct {
  gorm.Model
  Number   string
  UserID   uint
}

type User struct {
  gorm.Model
  Name       string
  CreditCard CreditCard
}

db.Create(&User{
  Name: "jinzhu",
  CreditCard: CreditCard{Number: "411111111111"}
})
// INSERT INTO `users` ...
// INSERT INTO `credit_cards` ...
```

## トランザクション

トランザクション内で一連の処理を実行するサンプルフロー

```go
db.Transaction(func(tx *gorm.DB) error {
  if err := tx.Create(&Animal{Name: "Giraffe"}).Error; err != nil {
    // 何らかのエラーを返却するとロールバックされる
    return err
  }
  
  if err := tx.Create(&Animal{Name: "Lion"}).Error; err != nil {
    return err
  }
  
  // nilが返却されるとトランザクション内の全処理がコミットされる
  return nil
}
```


## レコードの取得
### 単一のオブジェクトを取得する

```go
// 1件目のレコードを取得かつ主キー順に並べる
db.First(&user)
// SELECT * FROM users ORDER BY id LIMIT 1;

// 1件目のレコードを取得
db.Take(&user)
// SELECT * FROM users LIMIT 1;

// 最後のレコードを取得かつ主キー順に並べる
db.Last(&user)
// SELECT * FROM users ORDER BY id DESC LIMIT 1;

result := db.First(&user)
result.RowsAffected // レコード件数を返す
result.Error        // errorかnilを返す

// ErrRecordNotFoundエラーが起きていないかチェックする
errors.Is(result.Error, gorm.ErrRecordNotFound)
```

### IN句

```go
db.Where("name IN ?", []string{"jinzhu", "jinzhu 2"}).Find(&users)
// SELECT * FROM users WHERE name IN ('jinzhu','jinzhu 2');
```

### Pluck

1つのカラムの値を取得してsliceに代入する

```go
var ages []int64
db.Model(&users).Pluck("age", &ages)

var names []string
db.Model(&User{}).Pluck("name", &names)

db.Table("deleted_users").Pluck("name", &names)

// Distinct Pluck
db.Model(&User{}).Distinct().Pluck("Name", &names)
// SELECT DISTINCT `name` FROM `users`
```

2つ以上のカラムを指定する場合は、以下のように `Scan` もしくは `Find` を利用する

```go
db.Select("name", "age").Scan(&users)
db.Select("name", "age").Find(&users)
```
