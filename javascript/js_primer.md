# ラッパーオブジェクト
- 文字列はプリミティブ型の値であり、Stringオブジェクトのインスタンスではない
- プリミティブ型のプロパティにアクセスしたときに自動的にラッパーオブジェクトに変換される
  - 文字列はStringがラッパーオブジェクト。だから文字列に対してもStringオブジェクトのメソッドが呼び出せる

# 関数とスコープ

- [モジュールバンドラーはなぜモダンなフロントエンドの開発に必要なのか？｜Ko｜note](https://note.com/billion_dollars/n/n596fecfdeb2e)

- スコープがネストしている場合、内側のスコープから外側のスコープにある変数を参照できる
  - 関数スコープでも同様
  - 現在のスコープから外側のスコープへ順番に変数を探索する(スコープチェーン)
  - ない場合はReferenceErrorが発生する
- ビルトインオブジェクト
  - 自分で定義したグローバル変数以外に、プログラム実行時に自動的に定義される
  - undefinedやisNan、module、documentなど
    - undefinedはグローバル変数って前に学習しましたね...遠い記憶
- undefinedは最近のブラウザだと再代入できなくなっている
  - [undefined - JavaScript | MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/undefined#%E8%A7%A3%E8%AA%AC)

> 最近のブラウザー (JavaScript 1.8.5 / Firefox 4 以降) での undefined は、 ECMAScript 5 仕様により、設定不可、書込不可のプロパティとなります。 (そうでない場合でも、上書きは避けてください。)

```javascript
let undefined = 'hoge'
// => VM95:1 Uncaught SyntaxError: Identifier 'undefined' has already been declared

var undefined = 5
console.log(undefined)
// => undefined

// ブロックを区切れば書き換えできるっぽい
function fn(){
    var undefined = "独自の未定義値"; // undefinedという名前の変数をエラーなく定義できる
    console.log(undefined); // => "独自の未定義値"
}
fn();
// => 独自の未定義値
```
