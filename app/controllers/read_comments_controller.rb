class ReadCommentsController < ApplicationController
  def create
    read_book = BookRead.find(params[:book_read_id])
    read_comment = read_book.read_comments.new(comment_params)
    read_comment.user_id = current_user.id
    read_comment.save
    redirect_to request.referer
  end

  def destroy
    # book_read = BookRead.find(params[:book_read_id])
    # read_fav = book_read.read_favorites.find_by(user_id: current_user.id)
    # read_fav.destroy
    # redirect_to request.referer
  end

  private
  def comment_params
    params.require(:read_comment).permit(:comment)
  end
end
