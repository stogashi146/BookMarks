class HomesController < ApplicationController
  def about
    rand = Book.ids.shuffle.first(10) #Bookからランダムに10件取得
    @book = Book.find(rand)
  end
end
