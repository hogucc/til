# マンガでわかるRuby2から引用
require 'slack-ruby-bot'
class DiceBot < SlackRubyBot::Bot
  def self.possibilities(dice_type)
    case dice_type
    when "占い"
      [
        "大吉: 今日一日",
        "中吉: 今日何期待",
        "吉: 今日何何起〜",
        "凶: 今日悪気",
        "大凶: 今日失敗一日明日"
      ]
    when "ランチ"
      [
      "来軒",
      "",
      "料理",
      "THE GREAT BURGER",
      ]
    else
      [
      "目:one:",
      "目:two:",
      "目:three:",
      "目:four:",
      "目:five:",
      "目:six:",
      ]
    end
  end

  match /(\s+(?<dice_type>.+))?/ do |client, data, match|
    dice_type = match[:dice_type]
    client.say(text: possibilities(dice_type).sample,
    channel: data.channel)
  end
end

DiceBot.run
