# RSpec

## is_expectedとは？

`is_expected` は内部的に `expect(subject)` を実行している
なので、subjectに渡したブロックが実行されることになる

## is_expectedでraise_errorを検証する方法

subjectでprocを返すと動作する

```ruby
# これだと動作しない
context 'hoge' do
  subject { hoge }
  it { is_expected.to raise_error(StandardError)}
end

# subjectがprocを返すようにすると動く
context 'hoge' do
  subject { -> { hoge } }
  it { is_expected.to raise_error(StandardError)}
end
```
