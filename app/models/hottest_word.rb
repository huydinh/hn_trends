class HottestWord < ActiveRecord::Base
  serialize :value
  KEY_VALUES = [1, 2, 3, 7, 14, 28]

  def self.update_hottest_words
    KEY_VALUES.each do |key|
      result = Word.ranked_in_range(key)
      word = find_or_create_by_key(key_formular(key))
      word.value = result.take(Word::DEFAULT_LIMIT)
      word.save
    end
  end

  def self.key_formular(key)
    "#{key}_day_ago"
  end

  def self.from_date(from_date = 7)
    if KEY_VALUES.include?(from_date.to_i)
      self.find_by_key(key_formular(from_date))
    end
  end
end
