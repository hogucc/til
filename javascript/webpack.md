# webpack

cf. [全Rubyistに今すぐ伝えたいwebpackとwebpacker - Qiita](https://qiita.com/jesus_isao/items/1f519b2c6d53f336cadd)

webpackはJSなどのファイルをひとまとめにするモジュールバンドラー

[webpack](https://webpack.js.org/)

![img.png](sand-box/til/javascript/webpack_image.png)

webpackはloaderと呼ばれる外部ライブラリを使用することで前処理としてコンパイル（TSからJSへの変換など）を行ってから、モジュールをバンドルできる

また、pluginでバンドル後の後処理で生成されたファイルのサイズを圧縮することもできる

[Plugins | webpack](https://webpack.js.org/plugins/)

## loaderやpluginの使用方法

使用するloaderやpluginをyarnやnpmでインストールし、 `webpack.config.js` などのwebpackの設定ファイルでloaderやpluginの設定を追加する

## webpack誕生の経緯

もともとJSにはモジュールという概念はなかった

なので、クロージャや即時関数を使ってグローバル汚染な名前空間の汚染を防いでいた

（名前空間の汚染というのは、例えばvarで定義した変数を上書きしてしまうこと）

この問題を解決するために生まれたのがCommonJSやECMAScript Moduleといったモジュールの仕組み。これにより名前空間を分けられるようになった

```javascript
// それぞれ以下のように書くと名前空間を汚染せずにファイルを分割できるようになった
// CommonJS
const hoge = require('./HogeFile.js');
hoge.hogeMethod();

// ECMAScript Module
import fuga from './FugaFile.js';
fuga.fugaMethod();
```

ただ、これらのモジュールはブラウザによっては動かない問題が残っていた（IEとか...）

この問題を解決したのがモジュールバンドラーであるwebpack

webpackのおかげでモジュールで書いたものをモジュールが動かないブラウザでも取り込めるように1つのファイルにまとめて実行できるようになった

cf. [モジュールバンドラーはなぜモダンなフロントエンドの開発に必要なのか？｜Ko｜note](https://note.com/billion_dollars/n/n596fecfdeb2e)
