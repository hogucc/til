# リテラル
## 文字列リテラル
### ヒアドキュメント

識別子の開始ラベルによりヒアドキュメントの解釈法が異なる

- `"識別子"`： 式展開が有効
- `識別子`： ダブルクオートと同じ結果
- `'識別子'`： 式展開できない
- `` `識別子` ``： コマンド出力

`<<-識別子` と書くと最後の行をインデントできる。メソッドの中でヒアドキュメントを使うケースに便利

```ruby
if need_define_foo
  eval <<-EOS   # <<-を使うと
    def foo
      print "foo\n"
    end
  EOS
  #↑終端行をインデントできる
end

# これだとシンタックスエラーになる
s = <<EOF
    Hello,
    Ruby
    EOF
p s
# => can't find string "EOF" anywhere before EOF (SyntaxError)

# 終端行をインデントしないならOK
s = <<EOF
    Hello,
    Ruby
EOF
p s # => "    Hello,\n    Ruby\n"
```

`<<~識別子` と書くと内部の文字列をインデントさせても無視される

```ruby
print <<~FIRST
   これは一つめのヒアドキュメントです。
   まだ一つめです。
FIRST
# =>これは一つめのヒアドキュメントです。
#   まだ一つめです。
```

`"識別子"` や `識別子` ではインデントが有効

```ruby
heredoc = <<EOS
次のEOSまでが
　文字列リテラルとして
　　扱われます。
EOS
puts heredoc
# => 次のEOSまでが
#  　 文字列リテラルとして
#　　　 扱われます。
```
