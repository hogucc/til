## Psychライブラリ

### Psych.load
YAMLドキュメントをRubyのオブジェクトに変換する

Psych.loadだとどんなYAMLでもRubyのオブジェクトに変換してしまうので変なオブジェクトが作られてしまい、そこから任意のコードを実行できてしまう可能性がある。

### Psych.safe_load

Psych.loadには上記の脆弱性問題があり、安全性を考慮して変換されるオブジェクトを制御できるようにしたのが `safe_load`

デフォルトでは以下のクラスのオブジェクトしか変換されない

- TrueClass
- FalseClass
- NilClass 
- Numeric
- String 
- Array
- Hash

Dateオブジェクトは変換できない
```ruby
require 'yaml'
require 'date'

# birthdayにDateが含まれる
str_l = <<~YAML_EOT
  Tanaka Taro: {age: 35, birthday: 1970-01-01}
  Suzuki Suneo: {
    age: 13,
    birthday: 1992-12-21
  }
YAML_EOT

pp Psych.safe_load(str_l)
# 例外が発生する
# pp YAML.safe_load(str_l)でも同様に例外が発生する
Tried to load unspecified class: Date (Psych::DisallowedClass)
```

### Psych4.0.0ではPsych.loadのデフォルトの挙動がPsych.safe_loadになった

脆弱性問題は起きなくなるが、`Psych.load` で実装していた箇所で上記の変換可能なクラス以外がYAMLに入っていた場合、YAMLの読み込みに失敗する

対応策としてはpermitted_classesキーワード引数を使用して、必要なクラスを明示的に許可する

```ruby
pp Psych.safe_load(str_l, permitted_classes: [Date])
# =>
# {"Tanaka Taro"=>
# {"age"=>35, "birthday"=>#<Date: 1970-01-01 ((2440588j,0s,0n),+0s,2299161j)>},
# "Suzuki Suneo"=>
# {"age"=>13, "birthday"=>#<Date: 1992-12-21 ((2448978j,0s,0n),+0s,2299161j)>}}

# pp YAML.safe_load(str_l, permitted_classes: [Date]) でも同じ結果になる
```
