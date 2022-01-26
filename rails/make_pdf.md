# RailsアプリでPDFを生成する

cf. [20220125_令和版！RailsアプリでPDF生成するテクニック集 in 銀座Rails#41 - Speaker Deck](https://speakerdeck.com/morimorihoge/20220125-ling-he-ban-railsapuridepdfsheng-cheng-surutekunitukuji-in-yin-zuo-rails-number-41)

## 素のRubyでPDFを一から作成する

prawnというgemを使用する

https://github.com/prawnpdf/prawn

### メリット

- RubyのDSLでレイアウトを指定するので、細かなレイアウトにも対応できる

### デメリット

- Rubyが書ける人でないとメンテできない
- DSL特有の記法を覚えないといけないので学習コストがかかる

## HTML/CSSからPDFファイルを生成する

headlessブラウザにレンダリングさせたWebページをブラウザの機能でPDF出力させる

wicked_pdfとgroverというgemがメジャー

https://github.com/mileszs/wicked_pdf

https://github.com/rowanz/grover

wicked_pdfはwkhtmltopdfを内部的に使っているが、現在では更新が止まっているため、今から使うならgroverにしたほうがよいかも?

https://wkhtmltopdf.org/

実際に使ってみたときはgroverをつかうとM1 Mac環境でdockerが起動しない問題が起きて、結局wicked_pdfを使うことになった

### メリット

- レイアウトをHTML/CSSで記述できるので、Railsエンジニア以外も触れる

### デメリット
- 細かい配置調整しようとすると神CSSをかかざるを得なくなる

