# gitコマンド

## 特定のコミット内容を変更する

2つ以上前のコミットを修正するときの手順

1. `git rebase -i HEAD~[戻したいコミット数+1]`（例えばHEADの3つ前のコミットを修正したい場合は`HEAD~4`になる）
1. 修正したいコミットのpickをeditに変更
1. ファイルを修正し、`git add`する
1. `git commit --amend`（新しいコミットメッセージに変更する場合は`-m コミットメッセージ`をつける）
1. `git rebase --continue`

## マージコミットをrevertする
通常のコミットは `git revert コミットハッシュ` でrevertできる

が、マージコミットの場合は上記のような指定だと以下のようなエラーになる

```
error: Commit xxxxxx is a merge but no -m option was given.
```

### 原因

マージコミットをrevertする場合、「マージされた側のブランチ」「マージする側のブランチ」のどちらがメインラインなのかを判断でないとメンテできない

なので、`-m` でメインラインを指定する必要がある

`-m` は `--mainline` の略。


### 解決策
`-m 1`をつけて`git revert -m 1 コミットハッシュ` とすればrevertできる

`-m` の後ろに指定する数字は `parent-number`

`parent-number` に1を指定したときは「マージされた側のブランチ」、2のときは「マージする側のブランチ」になる

マージしたコミットそのものをrevertするときは1を使うのが良さそう

cf. https://git-scm.com/docs/git-revert

# gitで雑になんか試したいとき

- `git tag tmp_hogucc` でタグを切って試す
- 元ブランチから別の作業ブランチを切って作業する

# ブランチにメモを残しておきたいとき

`git branch --edit-description [<branchname>]` でブランチにメモを残せる

`<branchname>`を省略すると、現在のブランチにメモが追加される

メモを表示するコマンドは `git config branch.<branchname>.description`

