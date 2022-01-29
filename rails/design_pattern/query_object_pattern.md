# Queryオブジェクトパターン

cf. [詳解Railsデザインパターン：Queryオブジェクト - Takaokouji I/O](https://takaokouji.github.io/output/query-object/)

このパターンを用いることでscopeを別ファイルに切り出してモデルの肥大化を防げる

こちらにサンプルコードが載っている
https://github.com/Selleo/pattern/blob/master/lib/patterns/query.rb

この記事の例がシンプルでわかりやすい

以下、「Queryオブジェクトのルール」を引用

> - ファイルはapp/queriesに配置する
> - ベースとなるQueryクラスを定義する 
> - 接尾辞にQueryをつける
> - クラス名から返るRelationが予想できる名前にする
> - `#call`を定義し、ActiveRecord::Relationクラスのオブジェクトを返す
> - ActiveRecordモデルのscopeをとおしてのみ使用する。これにより、返るオブジェクトのクラスが自明となる
> - `#call` は副作用のないメソッドにする

ファイルは `app/queries` に配置するとあるが、仕事の場合はチームメンバーとも相談して決めるのが良さそう
