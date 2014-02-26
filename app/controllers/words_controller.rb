class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find params[:id]
  end

  def hottest
    if params[:from_date].present?
      @ranked_words = Word.ranked_in_range(params[:from_date])
    else
      @ranked_words = Rails.cache.fetch('all_ranked_words') { Word.ranked }
    end
    @ranked_words = @ranked_words.take(Word::DEFAULT_LIMIT)
  end

  def hottest_in_range
    redirect_to hottest_words_path(from_date: params[:from_date])
  end
end
