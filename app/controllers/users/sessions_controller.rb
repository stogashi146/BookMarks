# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_deleted_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
    return flash[:alert] = "現在はゲストユーザーでのみログインできます。"
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーでログインしました"
  end

  protected
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || timelines_path
  end

  def reject_deleted_user
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password]) && user.is_deleted
        redirect_to new_user_session_path
        flash[:alert] = 'お客様は退会済みです。申し訳ございませんが、あらためて会員登録をお願いいたします。'
      end
    end
  end
end
