class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def osso
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in(@user)

    render json: @user.to_json
  end
end