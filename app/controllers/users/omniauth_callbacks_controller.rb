class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_action :verify_authenticity_token

  def steam
    @user = User.find_for_steam_oauth(request.env["omniauth.auth"])

    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => "Steam")

  end
end
