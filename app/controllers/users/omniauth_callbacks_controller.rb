class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    sign_in(:github)
  end

  def twitter
    sign_in(:twitter)
  end


  protected


  def sign_in(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication and return
    else
      flash[:error] = "Error in auth"
      redirect_to root_url and return
    end
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_url
  end
end