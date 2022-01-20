## 使用されるタイムゾーン

c.f [RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い - Qiita](https://qiita.com/jnchito/items/cae89ee43c30f5d6fa2c#activesupporttimewithzone%E3%82%AF%E3%83%A9%E3%82%B9)

## TimeまたはTimeWithoutZone

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

### strftimeパターン集

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
