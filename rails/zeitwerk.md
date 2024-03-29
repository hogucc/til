# Zeitwerk

## Zeitwerkを無効にする

[Classic to Zeitwerk HOWTO — Ruby on Rails Guides](https://guides.rubyonrails.org/classic_to_zeitwerk_howto.html#having-app-in-the-autoload-paths)

以下のようにディレクトリやファイルを指定して、Zeitwerkを無効にできる

```ruby
# config/initializers/zeitwerk.rb
Rails.autoloaders.main.ignore(
  "app/admin",
  "app/assets",
  "app/javascripts",
  "app/views"
)
```

## 一部のファイルのみで使いたい定数名を定義する

`if basename` に使いたいファイル名やディレクトリの正規表現を指定

以下のコードの一部はhttps://techracho.bpsinc.jp/hachi8833/2019_01_28/68986から引用

```ruby
# config/initializers/zeitwerk.rb
class MyInflector < Zeitwerk::Inflector
  def camelize(basename, abspath)
    case basename
    when "api"
      "API"
    when "mysql_adapter"
      "MySQLAdapter"
    else
      super
    end
  end
end

Rails.autoloaders.each do |autoloader|
  autoloader.inflector = MyInflector.new
end
```

## autoloadとeager load

- development環境ではautoloadが有効で、eager loadが無効
- production環境ではその逆。eager loadが有効で、autoloadが無効

eager loadは一括読み込み、autoloadはその定数が参照されたときに読み込み
