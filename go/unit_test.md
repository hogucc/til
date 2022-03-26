# テストコード

Goでは本体コードと同じパッケージ（ディレクトリ）にテストファイルを作成する

ファイル名は `xxx_test.go` にする

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
