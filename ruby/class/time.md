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
