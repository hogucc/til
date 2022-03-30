# Encodingクラス

# .aliases

エンコーディングのエイリアスを取得する

```ruby
p Encoding.aliases
{"BINARY"=>"ASCII-8BIT", "CP437"=>"IBM437", "CP720"=>"IBM720", "CP737"=>"IBM737", "CP775"=>"IBM775", "IBM850"=>"CP850", "CP857"=>"IBM857", "CP860"=>"IBM860", "CP861"=>"IBM861", "CP862"=>"IBM862", "CP863"=>"IBM863", "CP864"=>"IBM864", "CP865"=>"IBM865", "CP866"=>"IBM866", "CP869"=>"IBM869", "CP1258"=>"Windows-1258", "Big5-HKSCS:2008"=>"Big5-HKSCS", "ebcdic-cp-us"=>"IBM037", "eucJP"=>"EUC-JP", "euc-jp-ms"=>"eucJP-ms", "EUC-JISX0213"=>"EUC-JIS-2004", "eucKR"=>"EUC-KR", "eucTW"=>"EUC-TW", "EUC-CN"=>"GB2312", "eucCN"=>"GB2312", "CP936"=>"GBK", "ISO2022-JP"=>"ISO-2022-JP", "ISO2022-JP2"=>"ISO-2022-JP-2", "ISO8859-1"=>"ISO-8859-1", "ISO8859-2"=>"ISO-8859-2", "ISO8859-3"=>"ISO-8859-3", "ISO8859-4"=>"ISO-8859-4", "ISO8859-5"=>"ISO-8859-5", "ISO8859-6"=>"ISO-8859-6", "CP1256"=>"Windows-1256", "ISO8859-7"=>"ISO-8859-7", "ISO8859-8"=>"ISO-8859-8", "CP1255"=>"Windows-1255", "ISO8859-9"=>"ISO-8859-9", "ISO8859-10"=>"ISO-8859-10", "ISO8859-11"=>"ISO-8859-11", "CP874"=>"Windows-874", "ISO8859-13"=>"ISO-8859-13", "ISO8859-14"=>"ISO-8859-14", "ISO8859-15"=>"ISO-8859-15", "ISO8859-16"=>"ISO-8859-16", "CP878"=>"KOI8-R", "MacJapan"=>"MacJapanese", "ASCII"=>"US-ASCII", "ANSI_X3.4-1968"=>"US-ASCII", "646"=>"US-ASCII", "CP65000"=>"UTF-7", "CP65001"=>"UTF-8", "UTF-8-MAC"=>"UTF8-MAC", "UTF-8-HFS"=>"UTF8-MAC", "UCS-2BE"=>"UTF-16BE", "UCS-4BE"=>"UTF-32BE", "UCS-4LE"=>"UTF-32LE", "CP932"=>"Windows-31J", "csWindows31J"=>"Windows-31J", "SJIS"=>"Windows-31J", "PCK"=>"Windows-31J", "CP1250"=>"Windows-1250", "CP1251"=>"Windows-1251", "CP1252"=>"Windows-1252", "CP1253"=>"Windows-1253", "CP1254"=>"Windows-1254", "CP1257"=>"Windows-1257", "locale"=>"UTF-8", "external"=>"UTF-8", "filesystem"=>"UTF-8"}
```

- SJISはWindows-31Jのエイリアス
  - SHIFT_JISのエイリアスではない
- Windows-31Jはマイクロソフト以外の企業が独自拡張した文字コードを統合し、標準化した文字コード

https://developers.freee.co.jp/entry/sjis-is-not-an-alias-of-shift-jis
