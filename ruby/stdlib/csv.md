# CSV

## .parse

headersオプションがtrueかfalseかでrow（行）の値が違う

- true: CSV::Row
  - CSV::Row#to_sはCSVの文字列として返す
  - https://docs.ruby-lang.org/ja/latest/class/CSV=3a=3aRow.html#I_TO_CSV
- false: Array
  - Array.to_sは自身を人間に読みやすい文字列にして返す
  - https://docs.ruby-lang.org/ja/latest/method/Array/i/to_s.html

```ruby
require "csv"
=> true
s = <<EOS
id,first name,last name,age
1,taro,tanaka,20
2,jiro,suzuki,18
EOS
=> "id,first name,last name,age\n1,taro,tanaka,20\n2,jiro,suzuki,18\n"

CSV.parse(s, headers: true).each {pp({klass: _1.class, value: _
  1.to_s})}
{:klass=>CSV::Row, :value=>"1,taro,tanaka,20\n"}
{:klass=>CSV::Row, :value=>"2,jiro,suzuki,18\n"}
=> #<CSV::Table mode:col_or_row row_count:3>     
CSV.parse(s, headers: false).each {pp({klass: _1.class, value:
_1.to_s})}
{:klass=>Array, :value=>"[\"id\", \"first name\", \"last name\", \"age\"]"}
{:klass=>Array, :value=>"[\"1\", \"taro\", \"tanaka\", \"20\"]"}
{:klass=>Array, :value=>"[\"2\", \"jiro\", \"suzuki\", \"18\"]"}
=>
  [["id", "first name", "last name", "age"],
   ["1", "taro", "tanaka", "20"],
   ["2", "jiro", "suzuki", "18"]]  
```

## CSV::Row.each {|header, field| ... } -> self

CSV.parseしたときに `headers` にtrueを指定するとrowのクラスはCSV::Rowになる

では、CSV::Row.eachの挙動はどうなるか？

```ruby
require "csv"
=> true
s = <<EOS
id,first name,last name,age
1,taro,tanaka,20
2,jiro,suzuki,18
EOS
=> "id,first name,last name,age\n1,taro,tanaka,20\n2,jiro,suzuki,18\n"

##-------------ここまでは.parseメソッドのサンプルコードと一緒
CSV.parse(s, headers: true).each_with_index do |row, index|
  row.each{|header, field| puts "#{header} - #{field}"} 
end
id - 1
frist name - taro
last name - tanaka
age - 20
id - 2
frist name - jiro
last name - suzuki
age - 18
=> #<CSV::Table mode:col_or_row row_count:3>
```

CSV::Row.eachは与えられたブロックにヘッダとフィールドの組を渡して評価する

では、each_with_indexは？

```ruby
CSV.parse(s, headers: true).each_with_index do |row, index| 
  row.each_with_index{|header_and_field, index| puts "#{header_and_field} - #{index}"}
end
["id", "1"] - 0
[" frist name", "taro"] - 1
[" last name", "tanaka"] - 2
[" age", "20"] - 3
["id", "2"] - 0
[" frist name", "jiro"] - 1
[" last name", "suzuki"] - 2
[" age", "18"] - 3
=> #<CSV::Table mode:col_or_row row_count:3>
```

each_with_indexは与えられたブロックに第一要素がヘッダ、第二要素がフィールドの配列、インデックスを渡して評価する
