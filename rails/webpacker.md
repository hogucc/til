# Webpacker
webpackをRailsから扱いやすくするためのラッパー

Rails5.1から標準的に利用されている

それまでJavaScriptの管理はRails3.1から利用されていたSprocketsが担っていた

## Webpackerのインストール

`bin/rails webpacker:install` を実行する

- `app/javascript`
- `config/webpacker.yml`
- `babel.config.js`
  - https://babeljs.io/
  - babelはJavaScriptの最新の文法をどのブラウザでも使用できるように、新しい書き方から古い書き方へ変換するためのツール
- `postcss.config.js`
  - https://postcss.org/
  - postcssはベンダープレフィックスを自動で付与して、どのブラウザでもCSSが有効になるようにする
    - ベンダープレフィックスとは `-ms-` や `-webkit-` などCSSのプロパティの拡張機能をブラウザに適用するための接頭辞
  - 他にも新しいCSSの構文をブラウザで動くような書き方に直したりする
- `.browserslistrc`
  - https://github.com/browserslist/browserslist
  - CSSにどのベンダープレフィックスをつけるかを決める設定ファイル

## WebpackerとSprocketsどちらを使えばいいの？

WebpackerとSprocketsはどちらもアセットパッケージングツールで、機能が重複している
どちらもJavaScriptをブラウザに適したファイルにコンパイルする
デフォルトではJavaScriptはWebpacker、CSSはSprocketsを利用してコンパイルや縮小・圧縮が行われる

cf. [Webpacker の概要 - Railsガイド](https://railsguides.jp/webpacker.html#webpacker%E3%81%8Csprockets%E3%81%A8%E7%95%B0%E3%81%AA%E3%82%8B%E7%90%86%E7%94%B1)

### Webpackerを使ったほうが良さそうなケース
- NPMパッケージを使いたい場合
- 最新のJavaScript機能やツールにアクセスしたい場合

### Sprocketsを使ったほうが良さそうなケース
- 移行にコストがかかるレガシーアプリケーション
- gemで統合したい場合
- パッケージ化するコードの量が少ない場合

## webpack-dev-server

`bin/webpack-dev-server` コマンドを実行するとJSがホットリロードされる

コマンドの実行は `bin/rails s` の後でも先でも関係なく、どちらでもホットリロードしてくれる

ホットリロードされると、わざわざブラウザを更新しなくても、JSの変更をブラウザに適用してくれる

## config/webpacker.yml

Webpackerの設定を定義するyamlファイル

webpackを単体で利用するときは `webpack.config.js` という設定ファイルを使用する

`config/webpacker.yml` では設定できる範囲外のことをしたい場合は `webpack.config.js` を使う

