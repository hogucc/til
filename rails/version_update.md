# バージョンアップデート

## Rails::Application::Configuration#load_defaults

cf. https://moneyforward.com/engineers_blog/2022/05/18/new_framework_defaults-for-rails/

指定したバージョンでのデフォルト設定を読み込むメソッド

config/application.rbに設定される

```ruby 
module Hoge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
　　 ...
```

railsのgemのバージョンに関わらず、load_defaultsに設定したデフォルトの設定が読み込まれる

load_defaultsの値は`bin/rails app:update` をしても更新されない。バージョンを上げる場合は手動で更新する必要がある
