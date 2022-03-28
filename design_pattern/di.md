# DIパターン

以下の記事の内容を引用しつつまとめる

- [【必須科目 DI】DIの仕組みをGoで実装して理解する - Qiita](https://qiita.com/yoshinori_hisakawa/items/a944115eb77ed9247794)


## DIパターンとは
Dependency Injectionの略

処理に必要なオブジェクトを外部（他のオブジェクト）から注入できるようにするデザインパターン

オブジェクトをインターフェースとして定義し、使う側は実装オブジェクトではなく、インターフェースを利用する

## なぜDIを使うのか

- 外部のDBに依存しないので変更に強くなる
  - インターフェースを使う側は実装オブジェクトを意識しなくて良いため
- ユニットテストがしやすい
  - DBをモックすることでインターフェースを使う側はテストしやすい

## GoではどのようにDIを使う？

クリーンアーキテクチャの初期化処理でよく使われる

コードは以下から抜粋
https://www.cetus-media.info/article/2020/go-wire/

コントローラーを作成する際、コントローラーに必要なコンポーネントをInjectionしていく

```go
func NewController(usecase Usecase) Controller {
	return &controller{usecase}
}

func NewUsecase(repository Repository) Usecase {
	return &usecase{repository}
}

func NewRepository(db DB) Repository {
	return &repository{db}
}

func main() {
	db := InitDB()
	controller := NewController(NewUsecase(NewRepository(db)))
}
```
