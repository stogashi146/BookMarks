class ReadFavoritesController < ApplicationController
  def create
    book_read = BookRead.find(params[:book_read_id])
    read_fav = book_read.read_favorites.new(user_id: current_user.id)
    read_fav.save
    redirect_to request.referer
  end

  def destroy
    book_read = BookRead.find(params[:book_read_id])
    read_fav = book_read.read_favorites.find_by(user_id: current_user.id)
    read_fav.destroy
    redirect_to request.referer
  end
end
