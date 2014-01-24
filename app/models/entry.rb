class Entry < ActiveRecord::Base
  has_many :words, through: :word_references, dependent: :destroy
  has_many :word_references, dependent: :destroy

  scope :sorted, -> { order('hn_id desc') }

  def index_title
    indexer = Indexer.new(title)

    indexer.to_words.each do |text|
      word = Word.find_by_text(text)
      if word
        word.increment!(:count)
        word.entries << self
      else
        new_word = Word.create(text: text)
        new_word.entries << self
      end
    end
  end

  def self.fetch
    @entries = RubyHackernews::Entry.all(3)

    @entries.each do |hn_entry|
      begin
        link = hn_entry.link
        entry = Entry.create(title: link.title, href: link.href, hn_id: hn_entry.id)
        entry.index_title
      rescue Exception => e
        p e.message
      end
    end
  end
end
