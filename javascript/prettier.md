Prettier は Node.js 上で動作するコードフォーマッター。

## 導入手順

[【Visual Studio Code】コードフォーマッタ Prettier を使う方法 - atnr.net](https://www.atnr.net/how-to-use-prettier-on-code/)

1. `npm i -D prettier`でインストール
1. package.json に以下の行を追加する。`prettier --write`の後ろのファイル名は相対パス指定でも絶対パス指定でも動いた。
   ```
   "scripts": {
     "format": "prettier --write '*.js'"
   }
   ```
1. `npm run format`を実行。インデントめちゃくちゃなところとかを自動で直してくれる。

## VSCode のプラグイン

- 手動実行
  コマンドパレット（Command+Shift+p で表示される）で"Format Document"を実行すると、フォーマットを修正してくれる。

- ファイル保存時に自動実行
  VSCode の設定で editor.formatOnSave をチェックすると保存時に自動でフォーマットしてくれる
