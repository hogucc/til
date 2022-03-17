# Clean Architecture

cf. https://little-hands.hatenablog.com/entry/2018/12/10/ddd-architecture

アーキテクチャ全体像

- Presentation層
  - Controller
- Infrastructure層
  - Repository
- Use Case層
  - Use Case
- Domain層
  - Repository(Interface)

## 各層の責務
- Controller
  - エンドポイント定義
  - Http Requestで渡された値とApplication層に渡す値のマッピング
  - 入力値のvalidation（一部）
- Repository（実装クラス）
  - Entityの永続化/検索
- Use Case
  - ユースケースの実装
  - Entity、Value Objectの生成、使用、永続化依頼
  - EntityからPresentation層に渡す値への変換
- Repository(Interface)
  - Repositoryの仕様定義
  - ドメイン知識（ルール/制約）の表現
