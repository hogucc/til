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
