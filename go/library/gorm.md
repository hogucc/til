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

## モデルの宣言

デフォルトでは、主キーにID、テーブル名を表すための複数形かつスネークケースな構造体名、スネークケースなカラム名、作成と更新の時間をトラッキングするためのCreatedAt、UpdatedAtフィールドを利用する

```go
type User struct {
  ID           uint
  Name         string
  Email        *string
  Age          uint8
  Birthday     *time.Time
  MemberNumber sql.NullString
  ActivatedAt  sql.NullTime
  CreatedAt    time.Time
  UpdatedAt    time.Time
}
```

作成/更新日時は以下のように宣言すると、create/update時に自動で日付を更新してくれる

```go
type User struct {
  ...
  CreatedAt    time.Time `gorm:"autoCreateTime"` 
  UpdatedAt    time.Time `gorm:"autoUpdateTime"` 
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

## SQLインジェクションを引き起こすパターン

- [Gormにおける「仕様通り」なSQLインジェクションの恐れのある実装についての注意喚起 - ANDPAD Tech Blog](https://tech.andpad.co.jp/entry/2022/02/18/140000)

Find() や First() Last() Take() Delete()などの関数ではStructだけ引数で渡すこと！

以下の最後の、第二引数が文字列で渡るパターンでSQLインジェクションが発生する可能性がある

```go
db.Where("id = ?", "1").Find(&users)
// SELECT * FROM `users`  WHERE (id = '1')
db.Where(User{ID: 1}).Find(&users)
// SELECT * FROM `users`  WHERE (`users`.`id` = 1)
db.Find(&users, "id = ?", "1")
// SELECT * FROM `users`  WHERE (id = '1')
db.Find(&users, User{ID: 1})
//  SELECT * FROM `users`  WHERE (`users`.`id` = 1)
db.Find(&users, "1")
// SELECT * FROM `users`  WHERE (`users`.`id` = '1') 
```

userInputIDというパラメーターが渡ってきた場合、意図していない値まで取得できてしまう
```go
userInputID := "1=1"
db.Find(&users, userInputID)
// SELECT * FROM `users`  WHERE (`users`.`id` = '1=1') 
```

## カラム名

カラム名はフィールド名のsnake_caseを使用する

```go
type User struct {
  ID        uint      // column name is `id`
  Name      string    // column name is `name`
  Birthday  time.Time // column name is `birthday`
  CreatedAt time.Time // column name is `created_at`
}
```

カラムタグを使用することでカラム名を上書きできる

```go
type Animal struct {
  AnimalID int64     `gorm:"column:beast_id"`         // set name to `beast_id`
  Birthday time.Time `gorm:"column:day_of_the_beast"` // set name to `day_of_the_beast`
  Age      int64     `gorm:"column:age_of_the_beast"` // set name to `age_of_the_beast`
}
```

### 導出表の結合

Joinsを使用して導出表を結合できる

```go
type User struct {
    Id  int
    Age int
}

type Order struct {
    UserId     int
    FinishedAt *time.Time
}

// 導出表の作成
query := db.Table("order").Select("MAX(order.finished_at) as latest").Joins("left join user user on order.user_id = user.id").Where("user.age > ?", 18).Group("order.user_id")

// 結合
db.Model(&Order{}).Joins("join (?) q on order.finished_at = q.latest", query).Scan(&results)
// SELECT `order`.`user_id`,`order`.`finished_at` FROM `order` join (SELECT MAX(order.finished_at) as latest FROM `order` left join user user on order.user_id = user.id WHERE user.age > 18 GROUP BY `order`.`user_id`) q on order.finished_at = q.latest
```

### Scan

レコード取得結果を構造体へスキャン

```go
type Result struct {
  Name string
  Age  int
}

var result Result
db.Table("users").Select("name", "age").Where("name = ?", "Antonio").Scan(&result)

// Raw SQL
db.Raw("SELECT name, age FROM users WHERE name = ?", "Antonio").Scan(&result)
```

## レコードの更新

https://gorm.io/ja_JP/docs/update.html

すべてのフィールドを保存する場合は以下のように書く

```go
db.First(&user)

user.Name = "jinzhu 2"
user.Age = 100
db.Save(&user)
// UPDATE users SET name='jinzhu 2', age=100, birthday='2016-01-01', updated_at = '2013-11-17 21:34:10' WHERE id=111
```
