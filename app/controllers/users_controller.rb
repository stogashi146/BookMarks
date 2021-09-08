class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_correct_user, only: [:edit, :update]
  before_action :set_correct_canceluser, only: [:cancel, :unsubscribe]
  before_action :ensure_normal_user, only: [:cancel, :unsubscribe]

  def show
    @user = User.find(params[:id])
    @book_reads = @user.book_reads
    @book_unreads = @user.book_unreads
  end

  def edit
  end

  def update
    if user_params[:profile_image].present?
      result = Vision.get_image_data(user_params[:profile_image])
    else
      result = true
    end

    if result == false || @user.update(user_params) == false
      flash[:alert] = "プロフィールを更新できませんでした"
      flash[:alert] = "センシティブな画像が含まれています"  if result == false
      render :edit
    elsif @user.update(user_params) || result
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました！"
    end
  end

  def calender
    @books = current_user.unread_books
  end

  def cancel
  end

  def unsubscribe
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。ご利用いただきありがとうございました。"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_mail_send, :introduction, :profile_image)
  end

  def set_correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end

  def set_correct_canceluser
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user == current_user
  end

  def ensure_normal_user
    if User.find(params[:user_id]).email == "guest@book-marks.net"
      redirect_to request.referer, alert: "ゲストユーザーの退会はできません。"
    end
  end

end
