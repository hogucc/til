# Dependabot

古いライブラリのアップデートのPRを自動で作成してくれる

cf. https://dev.classmethod.jp/articles/dependabot-101/

## dependency-type

デフォルトの設定では親の依存性は見てくれるが、子の依存性までは見ない

`dependency-type` に `all` を指定すると子の依存性まで見てくれる

cf. https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/configuration-options-for-dependency-updates#allow

> All explicitly defined dependencies. For bundler, pip, composer, cargo, also the dependencies of direct dependencies


## open-pull-requests-limit
Dependabotが一度に開くPRの数には制限がある

その上限を `open-pull-requests-limit` で変えられる

```
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
    # Disable version updates for npm dependencies
    open-pull-requests-limit: 0

  - package-ecosystem: "pip"
    directory: "/"
    schedule:
      interval: "daily"
    # Allow up to 10 open pull requests for pip dependencies
    open-pull-requests-limit: 10
```

cf. https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/configuration-options-for-dependency-updates#open-pull-requests-limit
