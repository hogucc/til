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
