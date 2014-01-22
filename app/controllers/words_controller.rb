class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find params[:id]
  end

  def hottest
    @ranked_words = Word.ranked
  end
end
