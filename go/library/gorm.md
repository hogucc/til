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
