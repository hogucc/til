class TwelveDays
  @@VERSES_ARAY = [
    ['first', 'and a Partridge in a Pear Tree.'],
    ['second', 'two Turtle Doves, '],
    ['third', 'three French Hens, '],
    ['fourth', 'four Calling Birds, '],
    ['fifth', 'five Gold Rings, '],
    ['sixth', 'six Geese-a-Laying, '],
    ['seventh', 'seven Swans-a-Swimming, '],
    ['eighth', 'eight Maids-a-Milking, '],
    ['ninth', 'nine Ladies Dancing, '],
    ['tenth', 'ten Lords-a-Leaping, '],
    ['eleventh', 'eleven Pipers Piping, '],
    ['twelfth', 'twelve Drummers Drumming, ']
  ]

  def self.sing_day_verse(day)
    return "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n\n" if day == 1

    "On the #{@@VERSES_ARAY[day - 1][0]} day of Christmas my true love gave to me: " +
      @@VERSES_ARAY[0, day].reverse.inject('') { |whole_phrase, aray| whole_phrase + "#{aray[1]}" } + "\n\n"
  end

  def self.song
    (@@VERSES_ARAY.each_with_index.inject('') { |all_verses, (_day_verse, index)| all_verses + sing_day_verse(index + 1) }).delete_suffix!("\n")
  end
end
