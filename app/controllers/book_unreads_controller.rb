class BookUnreadsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book.book_unreads.create(user_id: current_user.id)
    # redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book.book_unreads.find_by(user_id: current_user.id).destroy
    # redirect_to request.referer
  end


end
