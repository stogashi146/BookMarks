# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    callback_from :twitter
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  private
  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      if @user.is_deleted
        redirect_to new_user_session_path
        flash[:alert] = 'お客様は退会済みです。申し訳ございませんが、あらためて会員登録をお願いいたします。'
      else
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        sign_in_and_redirect @user, event: :authentication
      end
    else
      # メール認証をスキップして登録する
      @user.skip_confirmation!
      @user.save
      session["devise.#{provider}_data"] = request.env['omniauth.auth']["info"]
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user
    end
  end
end
