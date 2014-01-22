class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def fetch
    Entry.fetch
    redirect_to words_path
  end
end
