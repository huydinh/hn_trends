class Word < ActiveRecord::Base
  has_many :word_references, dependent: :destroy
  has_many :entries, through: :word_references, dependent: :destroy
  DEFAULT_LIMIT = 40

  def point
    res = 0.0
    word_references.each do |reference|
      res += reference.point
    end
    res
  end

  def point_in_range(from_date, to_date)
    res = 0.0
    word_references.where('? <= created_at and created_at <= ?', from_date, to_date).each do |reference|
      res += reference.point
    end

    res
  end

  def self.ranked
    res = all.map do |word|
      [word, word.point]
    end

    res.sort_by{|o| o.last }.reverse
  end

  def self.ranked_in_range(from_date, to_date = DateTime.now)
    from_date = from_date.to_i.days.ago

    res = all.map do |word|
      [word, word.point_in_range(from_date, to_date)]
    end

    res.sort_by{|o| o.last }.reverse
  end
end
