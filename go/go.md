# Go

Goに入門したのでざっくりメモ

cf. 
- https://go-tour-jp.appspot.com/
- [Go言語：文法基礎まとめ - Qiita](https://qiita.com/HiromuMasuda0228/items/65b9a593275f769f6b69)

## パッケージ（package）

Goのプログラムはpackageで構成されている

packageを使用するときは、使用するファイル内にimportで宣言する

```go
import (
  "fmt"
)
```

## 変数

明示的な宣言と暗黙的な宣言の2種類ある

```go
// こちらは明示的な宣言
var i, j int = 1, 2

// 暗黙的な宣言では:= の代入文を使う。型推論が行われ、型指定の必要がない
i := 1
j := 2
s := "hoge"

// こんなかんじにも書ける
var (
    i := 1
    j := 2
    s := "hoge"
)
```

## 基本型

Goの基本型は次のとおり

```
bool

string

int  int8  int16  int32  int64
uint uint8 uint16 uint32 uint64 uintptr

byte // uint8 の別名

rune // int32 の別名
     // Unicode のコードポイントを表す

float32 float64

complex64 complex128
```

## 配列型

```go
package main

import "fmt"

// [要素数]要素の型{初期値}
primes := [6]int{2, 3, 5, 7, 11, 13}
fmt.Println(primes[3])
// 7

// a[1:4]は要素のうち1から3を含むスライスを作る（最初の要素は含み、最後の要素は含まない）
var s []int = primes[1:4]
fmt.Println(s)
// [3 5 7]
```

## interface{}型

```go
// 全ての型に互換性のあるインターフェースを定義できる
func main() {
    var i interface{} = "hello"
    
    s := i.(string)
    fmt.Println(s)
    // hello
    
    s, ok := i.(string)
    fmt.Println(s, ok)
    // hello true
    
    f, ok := i.(float64)
    fmt.Println(f, ok)
    // 0 false
    
    // インターフェースの値iが具体的な型(ここではfloat64)を保持し、基になる型の値を変数fに代入することを主張する
    f = i.(float64) // ここでpanicを起こす
    // panic: interface conversion: interface {} is string, not float64
    fmt.Println(f)
}
```

上記のように動的に行う型チェックのことを型アサーションといい、 `x.(T)` の形式で構成される

```go
//型アサーションと分岐を組み合わせた処理もできる
var i interface{} = "hello"

switch i.(type) {
    case bool:
        fmt.Println("bool")
    case int, uint:
        fmt.Println("int or uint")
    default:
        fmt.Println("don't know")
}
// don't know
```

