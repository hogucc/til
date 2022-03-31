# bundler

gemの依存関係を管理してくれるgem

## コマンド

### bundle add

cf. https://bundler.io/v2.3/man/bundle-add.1.html

`bundle add`はGemfileにgemを追加して、bundle installを実行する

以下のようにgroupオプションを指定すれば、Gemfileの指定の環境に追加できる
```
bundle add rails --group "development, test"
```

### bundle update

bundle updateは依存するライブラリもすべてバージョンアップされる

bundle update --conservativeを使うと、指定したライブラリのバージョンだけあげることができる
