# open-uriライブラリ

Rubyに標準で入っているライブラリ

これを使ってWebサイトにアクセスすることができ、 スクレイピングをするときなどに利用される

```ruby
require 'open-uri'

# 以下のコードで指定したURLのWeb上の情報を取得できる
io = OpenURI.open_uri('http://www.example.com')

# readメソッドで読み込んでputsで出力
puts io.read
```

nokogiriというgemを使ったスクレイピングをするときでもこのライブラリが使用される
cf. https://nokogiri.org/#how-to-use-nokogiri

```ruby
# nokogiriのサンプルコード
require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

# Search for nodes by css
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end
```
