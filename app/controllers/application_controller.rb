class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # サインアップ時にnameとname_idの登録を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :name_id, :name, :is_mail_send])
  end
end
