class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find params[:id]
  end

  def hottest
    if params[:from_date].present?
      @ranked_words = HottestWord.from_date(params[:from_date]).value
    else
      @ranked_words =  Word.ranked
    end
  end

  def hottest_in_range
    redirect_to hottest_words_path(from_date: params[:from_date])
  end
end
