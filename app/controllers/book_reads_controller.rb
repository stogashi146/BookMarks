class BookReadsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_read = book.book_reads.new(read_params)
    book_read.user_id = current_user.id
    book_read.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    book.book_reads.find_by(user_id: current_user.id).destroy
    redirect_to request.referer
  end

  private
  def read_params
    params.require(:book_read).permit(:rate, :comment, :is_shared)
  end

end
