class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def fetch
    begin
      Entry.fetch
      redirect_to words_path
    rescue Exception => e
      redirect_to words_path, notice: "There is something wrong when fetching: #{e.message}"
    end
  end
end
