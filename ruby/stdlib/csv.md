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
irb(main):001:0> require "csv"
=> true
irb(main):002:0" s = <<EOS
irb(main):003:0" id,first name,last name,age
irb(main):004:0" 1,taro,tanaka,20
irb(main):005:0" 2,jiro,suzuki,18
irb(main):006:0> EOS
=> "id,first name,last name,age\n1,taro,tanaka,20\n2,jiro,suzuki,18\n"

irb(main):008:0> CSV.parse(s, headers: true).each {pp({klass: _1.class, value: _
  1.to_s})}
{:klass=>CSV::Row, :value=>"1,taro,tanaka,20\n"}
{:klass=>CSV::Row, :value=>"2,jiro,suzuki,18\n"}
=> #<CSV::Table mode:col_or_row row_count:3>     
irb(main):009:0>
irb(main):010:0> CSV.parse(s, headers: false).each {pp({klass: _1.class, value:
_1.to_s})}
{:klass=>Array, :value=>"[\"id\", \"first name\", \"last name\", \"age\"]"}
{:klass=>Array, :value=>"[\"1\", \"taro\", \"tanaka\", \"20\"]"}
{:klass=>Array, :value=>"[\"2\", \"jiro\", \"suzuki\", \"18\"]"}
=>
  [["id", "first name", "last name", "age"],
   ["1", "taro", "tanaka", "20"],
   ["2", "jiro", "suzuki", "18"]]  
```
