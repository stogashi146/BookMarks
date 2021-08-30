class BookReadsController < ApplicationController
  before_action :authenticate_user!

  def show
    @book = Book.find(params[:book_id])
    @user = User.find(params[:user])
    @book_read = @book.book_reads.find_by(user_id: @user.id)
  end

  def create
    @book = Book.find(params[:book_id])
    book_review = @book.book_reads.new(read_params)
    book_review.user_id = current_user.id
    book_review.save
    book_review.create_notification_read(current_user)
    flash[:notice] = "レビューの投稿に成功しました"
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    book_read = book.book_reads.find_by(user_id: current_user.id).destroy
    book_read.destroy_notification_read(current_user)
    flash[:notice] = "レビューの削除に成功しました"
    redirect_to request.referer
  end

  def update
    book = Book.find(params[:book_id])
    book.book_reads.find_by(user_id: current_user.id).update(read_params)
    flash[:notice] = "レビューの編集に成功しました"
    redirect_to request.referer
  end

  private
  def read_params
    params.require(:book_read).permit(:rate, :comment, :is_shared, :tag_list)
  end

end
