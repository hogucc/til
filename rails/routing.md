# ルーティング
## id以外のroutingにする方法

例えば、`users/:id`ではなく、`users/:user_name`にする場合、以下のようにparamを指定する

```ruby
resources :users, param: user_name
```
