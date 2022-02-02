# Strong Parameters

マスアサインメント機能による脆弱性をカバーするための機能

## マスアサインメントとは

複数のモデルの属性を一括で代入する機能がマスアサインメント

たとえばマスアサインメント機能がないと、以下のように属性を1つずつ代入していく必要がある

```ruby
user = User.new
user.name = 'hogehoge'
user.email = 'hoge@example.com'
user.save!
```

マスアサインメント機能を利用すると以下のように書ける

```ruby
user = User.new(name: 'hogehoge', email: 'hoge@example.com')
user.save!
```

この機能を利用してコントローラーから受け取ったparamsをまるごとモデルに渡して、以下のようにオブジェクトを作成できる

```ruby
user = User.new(params[:user])
```

ただし、上記の場合、`params[:user]` に意図しないパラメータが入り込んでくる可能性がある

そうすると、意図しない属性が登録・更新されてしまう可能性がある

そこで、コントローラーに以下のように書くことで許可するパラメータを限定することができる

```ruby
class UsersController < ActionController::Base
  ...
  
  def update
    user = current_account.user.find(params[:id])
    user.update(person_params)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
```

`params.require(:user)` でparamsに `:user` がなければ例外が発生する

`permit(:name, :email)` では `name` と `email` 以外が渡されても無視して、`name` と `email` を更新する

無視するかどうかは `config.action_controller.action_on_unpermitted_parameters` の設定で変更できる

`false` なら無視、`:raise` なら `ActionController::UnpermittedParameters` の例外を発生させる、`:log` ならDEBUGログレベルでログに記録する

https://edgeapi.rubyonrails.org/classes/ActionController/Parameters.html

`name` か `email` のどちらかだけでもエラーは発生しない

