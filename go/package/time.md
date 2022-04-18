# Time

https://pkg.go.dev/time

```go
package main

import "time"
```

## 文字列から日時へのパース

time.Parseで変換できる

ただし、time.ParseのタイムゾーンはデフォルトでUTC

```go
t, _ := time.Parse("2006-01-02 15:04:05", "2018-01-01 00:00:00")
fmt.Println(t)
// => 2018-01-01 00:00:00 +0000 UTC
```

タイムゾーンを指定してparseする場合は以下の2通り

1. `time.Parse` でタイムインジケーターを指定

```go
t2, _ := time.Parse("2006-01-02 15:04:05 (MST)", "2018-01-01 00:00:00 (JST)")
fmt.Println(t2)
// => 2018-01-01 00:00:00 +0000 JST
```

2. `time.ParseInLocation` でロケーションを指定する

```go
jst, _ := time.LoadLocation("Asia/Tokyo")
t1, _ := time.ParseInLocation("2006-01-02 15:04:05", "2018-01-01 00:00:00", jst)
// => 2018-01-01 00:00:00 +0900 JST

// 第三引数のタイムゾーンより、文字列内で指定されているタイムインジケーターが優先される
t2, _ := time.ParseInLocation("2006-01-02 15:04:05 (MST)", "2018-01-01 00:00:00 (UTC)", jst)
// => 2018-01-01 00:00:00 +0000 UTC
```

```go
// 以下のような形式でも変換できる
date := "2022-03-01"
jst, _ := time.LoadLocation("Asia/Tokyo")
c, err := time.ParseInLocation("2006-01-02", date, jst)
fmt.Println("c: ", c)
fmt.Println("err: ", err)
# => c:  2022-03-01 00:00:00 +0900 JST
# => err:  <nil>
```

## 時刻オブジェクトを作成する

```go
t := time.Date(2001, 5, 20, 23, 59, 59, 0, time.UTC)
fmt.Println(t) // => "2001-05-20 23:59:59 +0000 UTC"
t = time.Date(2001, 5, 20, 23, 59, 59, 0, time.Local)
fmt.Println(t) // => "2001-05-20 23:59:59 +0900 JST"
```

## 現在の時刻を取得する

```go
t := time.Now()
fmt.Println(t)           // => "2022-04-15 14:02:55.260115871 +0000 UTC m=+0.000096400"
fmt.Println(t.Year())    // => "2022"
fmt.Println(t.Month())   // => "April"
fmt.Println(t.Day())     // => "15"
fmt.Println(t.Hour())    // => "14"
fmt.Println(t.Minute())  // => "2"
fmt.Println(t.Second())  // => "55"
fmt.Println(t.Weekday()) // => "Friday"
```

## 日付オブジェクトを作成する

```go
day := time.Date(2001, 5, 31, 0, 0, 0, 0, time.Local)
fmt.Println(day) // => "2001-05-31 00:00:00 +0900 JST"
```

## 日付オブジェクトを文字列に変換する

```go
day := time.Now()
const layout = "2006-01-02"
fmt.Println(day.Format(layout)) // => "2022-04-15"
```

## 月初や月末の日付を取得する

```go
// 月初はtime.Dateを使って1日を指定して取得
t1 := time.Now()
t2 := time.Date(t1.Year(), t1.Month(), 1, 0, 0, 0,0, time.Local)
fmt.Println(t2)
// 2022-04-01 00:00:00 +0000 UTC

// 月末は月初からAddDateで-1日する
t3 := time.Date(t1.Year(), t1.Month()+1, 1, 0, 0, 0,0, time.Local).AddDate(0, 0, -1)
fmt.Println(t3)
// 2022-04-30 00:00:00 +0000 UTC
```
