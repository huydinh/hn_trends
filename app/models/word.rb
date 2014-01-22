class Word < ActiveRecord::Base
  has_many :entries, through: :references, dependent: :destroy
  has_many :references, dependent: :destroy

  def point
    res = 0.0
    references.each do |reference|
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
end
