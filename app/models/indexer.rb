require 'stopwords/snowball'

class Indexer
  def initialize(text)
    @text = text.downcase
    @filter = Stopwords::Snowball::Filter.new 'en'
  end

  def to_words
    @filter.filter @text.split
  end
end
