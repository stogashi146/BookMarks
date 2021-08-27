class ReadCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_read = BookRead.find(params[:book_read_id])
    read_comment = @book_read.read_comments.new(comment_params)
    read_comment.user_id = current_user.id
    unless read_comment.save
      flash[:alert] = "コメントの投稿に失敗しました"
      redirect_to request.referer
    end
    @book_read.create_notification_comment(current_user, read_comment.id )
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_read = BookRead.find(params[:book_read_id])
    read_comment = ReadComment.find(params[:id])
    read_comment.destroy
  end

  private
  def comment_params
    params.require(:read_comment).permit(:comment)
  end
end
