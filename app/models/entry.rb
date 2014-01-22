class Entry < ActiveRecord::Base
  has_many :words, through: :references, dependent: :destroy
  has_many :references, dependent: :destroy

  scope :sorted, -> { order('hn_id desc') }

  def index_title
    title.downcase.split(' ').each do |text|
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
    @entries = RubyHackernews::Entry.all

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
