## npm
[npmのあまり知られてない機能 10選 - from scratch](https://yosuke-furukawa.hatenablog.com/entry/2014/06/10/100410)

### 作成したnpmのバージョンアップ
```
$ npm version patch
v0.2.1
$ npm version minor
v0.3.0
$ npm version major
v1.0.0
# package.jsonのversionプロパティが上がっている。
# git tag でみてみると
$ git tag
v0.2.1
v0.3.0
v1.0.0
#という具合にtagが作られてる
```


```
# 簡易フロー
$ npm version patch
v0.1.1
# master に push
$ git push origin master
# tagにpush
$ git push origin v0.1.1
# push終わったらnpmにpublish
$ npm publish
```
