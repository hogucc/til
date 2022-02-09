# CircleCI

cf. https://circleci.com/docs/ja/2.0/next-gen-migration-guide/

2020年にCircleCIイメージの次世代版が展開され始めた

## 変更点
### 名前空間の変更
`circleci` -> `cimg` に変更

例）circleci/ruby:2.3.0 -> cimg/ruby:2.3.0

### ブラウザテスト

従来は利用可能なバリアントタグが4種類あったが、今後は、CircleCI Browser Tools Orbとの併用を前提とした単一のタグに統合される

|old|new|
|---|---|
|-browsers|-browsers + browser orb tools|
|-browsers-legacy||
|-node-browsers||
|-node-browsers-legacy||

新しいバリアントタグ(`-browsers`)にはNode.jsやSeleniumなどのブラウザテスト用のユーティリティは含まれているが、実際のブラウザは含まれていない。

代わりにドライバーはbrowsers-tools Orbでインストールする

cf. https://circleci.com/developer/ja/orbs/orb/circleci/browser-tools
