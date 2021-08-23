class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_correct_user, only: [:edit, :update]
  before_action :set_correct_canceluser, only: [:cancel]

  def show
    @user = User.find(params[:id])
    @book_reads = @user.book_reads
    @book_unreads = @user.book_unreads
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました！"
    else
      render :edit, alert: "プロフィールを更新できませんでした"
    end
  end

  def calender
    @books = current_user.unread_books
  end

  def welcome
  end

  def cancel
  end

  def unsubscribe
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_mail_send, :introduction, :image)
  end

  def set_correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
  def set_correct_canceluser
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user == current_user
  end

end
