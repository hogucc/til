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

