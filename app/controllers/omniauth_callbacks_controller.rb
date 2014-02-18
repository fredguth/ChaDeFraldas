class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
  	#raise request.env["omniauth.auth"].to_yaml  
   
  	user = User.from_omniauth(request.env["omniauth.auth"])
    
    if user.persisted?
      flash.notice = "Você está logado!"
      sign_in user
      redirect_to 'http://apps.facebook.com/chadefralda/'
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to unauthorized_path
    end
  end
  alias_method :facebook, :all
end

