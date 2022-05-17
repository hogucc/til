# rbenv

## rbenv shell

シェル内にRBENV_VERSION環境変数を設定することで、シェル固有のRubyのバージョンを設定する

このバージョンはアプリのローカルやグローバルのバージョンを上書きする

RubyMineは `rbenv shell` でターミナルを起動していているので、`rbenv local` や `rbenv global` の指定が反映されない

なので、RubyMineでバージョンアップする場合は `rbenv shell` を使ってバージョンアップする

`$ rbenv shell 3.0.0`
