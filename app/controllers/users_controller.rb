class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_reads = @user.book_reads
    @book_unreads = @user.book_unreads
  end

  def edit
  end

  def update
  end

  def read

  end

  def unread
  end

  def follows
  end

  def followers
  end

  def welcome
  end

  def cancel
  end

  def unsubscribe
  end
end
