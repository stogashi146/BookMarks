class BookTagsController < ApplicationController
  def index
    @tags = BookRead.tagged_with(params[:tag])
    @tag_ranking = BookRead.tag_counts_on(:tags).most_used(30)
  end
end
