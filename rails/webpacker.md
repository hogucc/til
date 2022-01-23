# Webpacker
webpackをRailsから扱いやすくするためのラッパー

Rails5.1から標準的に利用されている

それまでJavaScriptの管理はRails3.1から利用されていたSprocketsが担っていた

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

