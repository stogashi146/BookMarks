# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  before_action :ensure_normal_user, only: [:create]
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
  protected
  def ensure_normal_user
    if params[:user][:email].downcase == "guest@book-marks.net"
      redirect_to new_user_session_path, alert: "ゲストユーザーのパスワード再設定はできません。"
    end
  end
end
