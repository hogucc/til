## YAMLライブラリ

YAMLを扱うためのライブラリ

YAMLはPsychというライブラリで実装されており、Psychを用いるとYAMLのパースと出力ができる

```ruby
str_l = <<~YAML_EOT
   Tanaka Taro: {age: 35}
   Suzuki Suneo: {
     age: 13,
   }
YAML_EOT
# => "Tanaka Taro: {age: 35}\nSuzuki Suneo: {\n  age: 13,\n}\n"
YAML.load(str_l)
# {"Tanaka Taro"=>{"age"=>35}, "Suzuki Suneo"=>{"age"=>13}}
# YAMLをハッシュにparse
YAML.load(str_l).class
# => Hash
```
