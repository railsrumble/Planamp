class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    oauth_sign_in(:github)
  end

  def twitter
    oauth_sign_in(:twitter)
  end


  protected


  def oauth_sign_in(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: provider)
      end
      sign_in_and_redirect(@user, event: :authentication) and return
    else
      flash[:error] = "Error in auth"
      redirect_to(root_url) and return
    end
  end

  def after_omniauth_failure_path_for(scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_url
  end
end
