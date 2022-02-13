# 使用されるタイムゾーン

c.f [RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い - Qiita](https://qiita.com/jnchito/items/cae89ee43c30f5d6fa2c#activesupporttimewithzone%E3%82%AF%E3%83%A9%E3%82%B9)

## TimeまたはTimeWithoutZoneの場合

### application.rbのタイムゾーン

以下を使用するとTimeWithZoneクラスのインスタンスが返却され、application.rbのタイムゾーンが使用される
- Time.current
- Time.zone.xxx
- xxx.in_time_zone

```ruby
Time.zone.local(2007, 2, 10, 15, 30, 45).class
=> ActiveSupport::TimeWithZone
Time.current.class
=> ActiveSupport::TimeWithZone
Time.zone.class
=> ActiveSupport::TimeZone
str = '2015-01-01 00:00:00'
=> "2015-01-01 00:00:00"
str.in_time_zone.class
=> ActiveSupport::TimeZone
```

### 環境変数のタイムゾーン

- Time.now
- Time.parse
- xxx.to_time
- Time.now.end_of_day
- Time.now.since(x.minute)

※ 環境変数に無効なタイムゾーンを設定した場合はUTC扱いになるので注意！

## Dateの場合

Dateクラスのインスタンスはタイムゾーン情報が保持されない

### application.rbのタイムゾーン

- Date.current
    - application.rbのタイムゾーンを使うが、タイムゾーン情報は保持されない

```ruby
Date.current
# => Fri, 28 Jan 2022
Date.current.class
# => Date
```


### 環境変数のタイムゾーン
-  Date.Today
    - 環境変数のタイムゾーンを使うが、タイムゾーン情報は保持されない
```ruby
Date.today
# => Fri, 28 Jan 2022
Date.today.class
# => Date
```

cf. https://thoughtbot.com/blog/its-about-time-zones#a-summary-of-do39s-and-don39ts-with-time-zones
以下、上記のURLからの引用
> A summary of do’s and don'ts with time zones

> DON’T USE
> * Time.now
> * Date.today
> * Date.today.to_time
> * Time.parse("2015-07-04 17:05:37")
> * Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z")

> DO USE
> Time.current
> * 2.hours.ago
> * Time.zone.today
> * Date.current
> * 1.day.from_now
> * Time.zone.parse("2015-07-04 17:05:37")
> * Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z").in_time_zone

### Date.currentとDate.todayの違い

cf. [Active Support コア拡張機能 - Railsガイド](https://railsguides.jp/active_support_core_extensions.html#date-current)

> Active Supportでは、Date.currentを定義して現在のタイムゾーンにおける「今日」を定めています。このメソッドはDate.todayと似ていますが、ユーザー定義のタイムゾーンがある場合にそれを考慮する点が異なります。

> ユーザー定義のタイムゾーンを考慮するメソッドを用いて日付を比較したい場合、Date.todayではなく必ずDate.currentを使ってください。将来、ユーザー定義のタイムゾーンがシステムのタイムゾーンと比較されることがありえます。

ユーザー定義のタイムゾーンを変えても `Date.today` だと反映されない
`Date.current` を使ったほうが良さそう

## Dateクラスのオブジェクトに対するin_time_zoneの変換

Dateクラスのオブジェクトに対するin_time_zoneの変換を実行すると、元の日付＋00:00:00になる

```ruby
Date.current.in_time_zone
# => Fri, 28 Jan 2022 00:00:00.000000000 JST +09:00
```

# strftimeパターン集

cf. [[Ruby/Rails] strftimeのよく使うテンプレート｜TechRacho by BPS株式会社](https://techracho.bpsinc.jp/hachi8833/2016_10_06/25960)

「2022年01月20日 20:35:12」
```ruby
Time.zone.now.strftime("%Y年%m月%d日 %H:%M:%S")
```

「20220120」
```ruby
Time.zone.now.strftime('%Y%m%d')
```

「08:35 PM」
```ruby
time.strftime('%I:%M %p')
```
