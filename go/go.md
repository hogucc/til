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

### パッケージをインストールしても実行できない場合

cf. [command not foundと$PATH【Go】 - 技術向上](https://tech-up.hatenablog.com/entry/2019/04/04/224255)

PATHが通っていない可能性あり

PATHが通っているかどうかは以下のコマンドで確認できる

```
# GOPATHはGoの作業ディレクトリ
$ echo $GOPATH
# PATHはインストールしたパッケージのコマンドなどが記述されたバイナリファイルが格納される場所
$ echo $PATH
```

もし上記のコマンドを実行しても何も出力されない場合、 zshrcなどに以下の記述が必要

```go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

ターミナルでexportしても良いが、ターミナルを起動する度に実行する必要があるので、zshrcなどに環境変数として設定したほうが楽

## go run

自動的にコンパイル実行してくれる便利コマンド

コンパイルだけなら `go build` を使う

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

### 変数の命名

基本的にlowerCamel。アンダースコアは使わない

他のパッケージから参照される変数名は、UpperCamel

頭文字（IDとかURLとか）は `Id` ではなく `ID` または `id` のどちらか

他の単語と組み合わせる場合は `xxxID` とする

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

宣言の仕方は以下のパターン

- var 変数名 [長さ]型
- var 変数名 [長さ]型 = [大きさ]型{初期値1, ..., 初期値n}
- 変数名 := [...]型{初期値１, ..., 初期値n}
  - この方法のみ要素数は省略可能だが、初期値の要素数がカウントされるので、要素数を明記したのと同じ

配列は宣言時にサイズを指定する必要がある

配列のサイズを途中で変えることはできない

## Slices（スライス）

スライスは可変長の配列

宣言時はサイズを指定しない

宣言の仕方は以下のパターン
- var 変数名 []型
- var 変数名 []型 = []型{初期値1, ..., 初期値n} 
- 変数名 := 配列[start:end]
  - 以下コード例

```go
func main() {
	primes := [6]int{2, 3, 5, 7, 11, 13}

	var s []int = primes[1:4]
	fmt.Println(s) // [3 5 7]
}
```

スライスに新しい要素を追加する場合は、Goの組み込みのappendを使う

```go
var s []int

s = append(s, 2, 3, 4)
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

## 構造体

```go
type Vertex struct {
X int
Y int
}

func main() {
v := Vertex{1, 2}
// 構造体のフィールドにはドットでアクセスする
v.X = 4
fmt.Println(v.X)
}
```

以下のように構造体に構造体を含めることもできる

```go
type Item struct {
    Name string
    Amount uint
}

type User struct {
    Name string
    Address
}

taro := User{
    Name: "Taro",
    Item: Address{
        Name: "knife",
        Prefecture: 1
    }
}

taro.Name // "Taro"
taro.Item.name // "knife"
taro.Item.Amount // 1
taro.Amount // 1
```

構造体は値型なため、関数の引数として渡すときは以下のように参照渡しする必要がある

以下は[Go言語：文法基礎まとめ - Qiita](https://qiita.com/HiromuMasuda0228/items/65b9a593275f769f6b69)から引用

```go
type Point struct {
  X, Y int
}

func swap(p *Point) {
    x, y = p.X, p.Y
    p.X = y
    p.Y = x
}

p := Point{X: 1, Y: 2}
swap(&p)

p.X // == 2
p.Y // == 1
```

### 構造体の比較

cf. [Goにおける等値と等価の考察(struct1==struct2と&struct1==&struct2とreflect.DeepEqual(struct1,struct2)とreflect.DeepEqual(&struct1,&struct2)) - Qiita](https://qiita.com/Sekky0905/items/1ff4979d80b163e0aeb6)

以下のどれを使うか
- struct1==struct2
- &struct1==&struct2
- reflect.DeepEqual(struct1, struct2)

構造体が完全に同一のものかを確認するときは `&struct1==&struct1` で比較する（アドレスでの比較）

構造体が指しているものが同じ内容かを確認するときは `reflect.DeepEqual(struct1, struct2)` か `struct1==struct2` を使う

`reflect.DeepEqual` よりも `go-cmp` のほうが高度な検証が可能

https://github.com/google/go-cmp

```go
if diff := cmp.Diff(cat1, cat2); diff != "" {
  t.Errorf("User value is mismatch (-cat1 +cat2):\n%s, diff))
}
```

構造体のあるフィールドを比較対象から除く場合は `cmpopts.IgnoreFields` を使う

```go
type Cat Struct {
  Name string
  CreatedAt time.Time
  UpdatedAt time.Time
}

opt := cmpopts.IgnoreFields(Cat{}, "CreatedAt", "UpdatedAt")

if diff := cmp.Diff(cat1, cat2, opt); diff != "" {
  t.Errorf("Cat value is mismatch (-cat1 +cat2):%s\n", diff)
}
```

## 関数
`func 関数名（引数　引数の型）戻り値の型 {}` の形式で定義する

```go
// 戻り値なし
func hoge() {
}

// 引数が複数の場合
func add(x, y int) int {
  return x + y
}

// 戻り値が複数の場合
func swap(x, y string)(string, string) {
  return y, x
}
```

## メソッド

Goにはクラスのしくみはないが、型にメソッドを定義できるようになる

メソッドはレシーバ引数を関数に取る

レシーバはfuncキーワードとメソッド名の間に自身の引数リストで表現する

```go
type Vertex struct {
	X, Y float64
}

func (v Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}
```

## スコープ

パッケージの中で変数、関数や定数を公開するかしないかをコントロールできる

識別子の1文字目が大文字の場合は公開される

小文字の場合はパッケージ内部でしか使えない

```go
package hoge

const (
  MAX = 1000
  min = 1
)

func HogeFunc(x int) int {
  return x
}

func hogefuga(y int) int {
  return y
}
```

```go
// main.go

package main

import "hoge"

hoge.MAX // => 1000
hoge.min // => error

hoge.HogeFunc(3) => 3
hoge.hogefuga(3) => error
```

## map

cf. https://ashitani.jp/golangtips/tips_map.html

Goではハッシュをmapと呼ぶ

`m := map[string]int{"apple": 150, "banana": 300, "lemon": 300}` の形式で定義する

### キーを指定して値を取得
`v, ok:=マップ[キー]`の形式でキーを指定して値を取得する

```go
m := map[string]int{"apple": 150, "banana": 300, "lemon": 300}

v, ok := m["apple"]
fmt.Println(v)  // => "150"
fmt.Println(ok) // => "true"

// 未定義のキーを渡すと0が返る
v, ok = m["papaia"]
fmt.Println(v)  // => "0"
fmt.Println(ok) // => "false"
```

### マップに要素を追加する

最初に空のマップを作ってから要素を追加する場合は以下のような書き方になる

```go
m := map[string]int{}
// m := make(map[string]int)

m["apple"] = 150
m["banana"] = 200
m["lemon"] = 300

fmt.Println(m["apple"])
```

### マップ内にキーが存在するかどうか調べる

```go
m := map[string]int{"apple": 150, "banana": 300, "lemon": 300}

_, ok := m["apple"]
fmt.Println(ok) // => "true"
_, ok = m["orange"]
fmt.Println(ok) // => "false"
```

### マップの要素数を取得する

len(マップ)で求められる

```go
m := map[string]int{"apple": 150, "banana": 300, "lemon": 300}

fmt.Println(len(m))
```

## ループ
### forの基本形
```go
for i := 0; i < 5; i++ {
    // iの値が0から9まで変化していく
    fmt.Printf("i = %d\n", i)
} 
```

### rangeを使ったfor

```go
var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

// 配列に対するrangeはindex番号と要素の値が返される
for i, v := range pow {
    fmt.Printf("2**%d = %d\n", i, v)
}

// index番号が不要の場合は以下のように書く
for _, v := range pow {
    fmt.Printf("2**%d = %d\n", i, v)
}
```

## ゼロ値

変数に初期値を与えずに宣言すると、ゼロ値（zero value）が与えられる

ゼロ値は型によって以下のように与えられる

数値型（int, floatなど）: 0

bool型: false

string型: ""（空文字列）

## エラーの扱い

https://go-tour-jp.appspot.com/methods/19

error型は組み込みのインターフェース

```go
i, err := strconv.Atoi("42")
if err != nil {
    fmt.Printf("couldn't convert number: %v\n", err)
    return
}
fmt.Println("Converted integer:", i)
```

errがnilの場合は成功、nilでない場合は失敗
