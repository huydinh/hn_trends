class WordReference < ActiveRecord::Base
  belongs_to :word
  belongs_to :entry

  def point
    reference_point
  end

  def age
    (DateTime.now.to_time - created_at.to_time) / 3600
  end

  def hn_point
    1.0 / (age ** 1.5)
  end

  def reference_point
    1
  end
end
