# ESLint

JavaScript のコードの静的解析ツール

## 導入

```
npm install eslint --save-dev

# or

yarn add eslint --dev
```

\_
グローバルインストールは`npm install eslint --global`で出来るが利用するプラグイン・共有設定もグローバル インストールしなければならないため推奨はされていない。

インストールが終わったらコンフィギュレーションファイルを作成する。

```
$ npx eslint --init
```

## 実行

```
$ eslint ファイル名
```

## npx コマンドとは

- npx は npm パッケージを簡単に実行できるコマンド。
- npx は npm@5.2.0 から同梱されるようになった。Node@8.2 以降を使用している環境であればデフォルトでインストールされている

## チェックルールの定義

- [デモページ](https://standardjs.com/demo.html)から JavaScript Standard Style に反していないかどうかをチェックできる。
- ESLint で JavaScript Standard Style を使用する場合は、package.json の編集が必要
  - [JavaScript Standard Style のススメ - Qiita](https://qiita.com/munieru_jp/items/ca16cbfa859468137d2e)
  - [VS Code に ESLint を設定する - Qiita](https://qiita.com/Mount/items/5f8196b891444575b7db)

### 参考

- [Getting Started with ESLint - ESLint - Pluggable JavaScript linter](https://eslint.org/docs/user-guide/getting-started)
- [知らないのは損！npm に同梱されている npx がすごい便利なコマンドだった | Developers.IO](https://dev.classmethod.jp/articles/node-npm-npx-getting-started/)
