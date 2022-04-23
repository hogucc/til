# テストコード

Goでは本体コードと同じパッケージ（ディレクトリ）にテストファイルを作成する

ファイル名は `xxx_test.go` にする

## Goのテストに対する考え方

この記事がとても参考できるようになった

[Go の Test に対する考え方 - Qiita](https://qiita.com/Jxck_/items/8717a5982547cfa54ebc)

Goには標準assertがない

ない理由はhttps://go.dev/doc/faq#assertions 参照

必要な機能はGo本体に揃っているので、DSLなどを使うことで覚えることを増やす必要はない、自分の意図を書こうという思想

異常系のテストでは何が落ちたかより、なんで落ちたかを書くのが良さそう

https://go.dev/src/net/http/serve_test.go#L224

## テストコードの書き方

関数名は `TestXXXX` で引数に `*testing.T` 型を取る必要がある

assertionも存在する
https://pkg.go.dev/github.com/stretchr/testify/assert

```go
// 値が等しいかを確認
assert.Equal(t, expected, actual)

// 値がnilであるか確認
assert.Nil(t, actual)

// 値がnilでないか確認
assert.NotNil(t, actual)

// エラー発生であることを確認
assert.Error(t, err)

// エラー発生でないことを確認
assert.NoError(t, err)
```

## テストの実行

`$ go test xxx_test.go` で実行できる

`$ go test ./...` とするとカレントディレクトリ配下のすべてのテストを実行できる

### テストコード内にfmtで出力するとき

`$ go test -v` を使うとfmtの実行結果が出力される

vオプションなしだと出力されない
