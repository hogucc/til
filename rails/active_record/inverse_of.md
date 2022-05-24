## inverse_of

基本的には指定しなくてもモデルの双方向関連付けが行われる

が、has_many, has_one, belongs_toで:throughや:foreign_keyを使うときは明示的にinverse_ofを指定する必要あり

inverse_ofはbelongs_to側に指定する

## 参考資料

- https://railsguides.jp/association_basics.html#belongs-to%E3%81%AE%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3-inverse-of
- https://sil.hatenablog.com/entry/rubocop-rails-inverse-of
- https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#module-ActiveRecord::Associations::ClassMethods-label-Setting+Inverses
