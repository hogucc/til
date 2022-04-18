# バリデーション

Goのバリデーションとしては以下がある

- https://github.com/go-playground/validator
  - 構造体にvalidateタグを定義する必要あり（なので、OpenAPIでのドキュメントの自動生成とかができない）
- https://github.com/go-ozzo/ozzo-validation
  - Validate関数でバリデーションを実装する
  - validationすべてがうまくいけばnilを返す、失敗すればエラーを返す

以下の記事が参考になりそう
- https://qiita.com/gold-kou/items/201a19d9d0c760cc2104
