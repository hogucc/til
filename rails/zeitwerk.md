# Zeitwerk

## Zeitwerkを無効にする

[Classic to Zeitwerk HOWTO — Ruby on Rails Guides](https://guides.rubyonrails.org/classic_to_zeitwerk_howto.html#having-app-in-the-autoload-paths)

以下のようにディレクトリやファイルを指定して、Zeitwerkを無効にできる

```ruby
# config/initializers/zeitwerk.rb
Rails.autoloaders.main.ignore(
  "app/admin",
  "app/assets",
  "app/javascripts",
  "app/views"
)
```

## 一部のファイルのみで使いたい定数名を定義する

`if basename` に使いたいファイル名やディレクトリの正規表現を指定

以下のコードの一部はhttps://techracho.bpsinc.jp/hachi8833/2019_01_28/68986から引用

```ruby
# config/initializers/zeitwerk.rb
class MyInflector < Zeitwerk::Inflector
  def camelize(basename, abspath)
    case basename
    when "api"
      "API"
    when "mysql_adapter"
      "MySQLAdapter"
    else
      super
    end
  end
end

Rails.autoloaders.each do |autoloader|
  autoloader.inflector = MyInflector.new
end
```

## autoloadとeager load

- development環境ではautoloadが有効で、eager loadが無効
- production環境ではその逆。eager loadが有効で、autoloadが無効

eager loadは一括読み込み、autoloadはその定数が参照されたときに読み込み

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
