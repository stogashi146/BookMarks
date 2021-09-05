class BookTagsController < ApplicationController
  def index
    @tags = BookRead.tagged_with(params[:tag]).select(:book_id).distinct
    @tag_ranking = BookRead.tag_counts_on(:tags).most_used(30)
  end
end
