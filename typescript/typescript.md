用語の整理
- 型引数: 型を宣言するときにパラメーターを持たせられる
    - 型名の後に<>で囲った部分が型引数
    - `type User<T>`
- ジェネリック型: 型引数を持つ型
- ジェネリクス: 型引数を受け取る関数を作る機能

# TS以外のトランスパイラ

CoffeScriptやDartはJavaScript以外の言語をJavaScript環境で動かせるようにする

TSはJavaScript+αのコードを動かせるようにするためのトランスパイラ

また、BabelもJSの最新の言語仕様を古いJSの環境でも実行できるように変換するトランスパイラだが、TSと異なり、型のチェックは行わない

# ジェネリクス(generics)

cf. https://typescriptbook.jp/reference/generics

引数の型が異なる共通の処理を定義する場合、型を固定してしまうと、型ごとに関数を定義する必要が出してしまう

この問題を解決するのがジェネリクス

型を変数のように扱い、呼び出し時に型を指定する

```typescript
// サバイバルTypeScriptから引用

// 注意: これは架空の文法です
function chooseRandomly<type>(v1: <type>, v2: <type>): <type> {
  return Math.random() <= 0.5 ? v1 : v2;
}
chooseRandomly<string>("勝ち", "負け");
chooseRandomly<number>(1, 2);
chooseRandomly<URL>(urlA, urlB);
```

↑だと `type` の部分を呼び出し時に型指定して確定させるイメージ

`type`などのような型を入れる変数のことを型変数と呼ぶ

型変数には変数名、関数名、クラス名に使える文字種と同じものを使用できるが、慣習的にはTが用いられる

型変数が2つの場合はTとUが用いられる

型変数に代入した値は型引数（`chooseRandomly<string>` のstringが型引数）

## ジェネリック型

型引数を持つ型のこと

※プロを目指す人のためのTypeScript入門から引用

↓型引数を持つ型の例
```typescript
type Family<Parent, Child> = {
    mother: Parent,
    father: Parent,
    child: Child,
}
```
