class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #comentei a linha abaixo por conta do Facebook
  #protect_from_forgery with: :exception
# def authenticate_facebook_user
# 	if current_user
# 		true
# 	else
# 		redirect_to '/users/auth/facebook'
# 	end
# end
private

  def current_event
    @current_event ||= Event.find_by_id(session[:event_id]) if session[:event_id]
  end
  helper_method :current_user
end
