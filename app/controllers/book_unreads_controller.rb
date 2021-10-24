class BookUnreadsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    book_unread = @book.book_unreads.create(user_id: current_user.id)
    book_unread.create_notification_release(current_user)
    flash[:notice] = "読みたいリストに追加しました"
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_unread = @book.book_unreads.find_by(user_id: current_user.id)
    book_unread.destroy_notification_release(current_user)
    book_unread.destroy
    flash[:notice] = "読みたいリストから削除しました"
  end


end
