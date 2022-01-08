# るりまのサンプルコードを抜粋
# https://docs.ruby-lang.org/ja/latest/class/WEBrick=3a=3aHTTPServer.html
# ※Ruby3.0では標準ライブラリからWEBrickが削除された
require 'webrick'

srv = WEBrick::HTTP::Server.new({:DocumentRoot => './', :BindAddress => '127.0.0.1', :Port => 20080 })
# '/view.cgi'とWEBrick::HTTP::Servlet::CGIHandlerを紐付け
srv.mount('/view.cgi', WEBrick::HTTP::Servlet::CGIHandler, 'view.rb')
# サーバの起動
srv.start
