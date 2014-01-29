class HomeController < ApplicationController
before_filter :authenticate_user!
  def index
  	@current_page="Home"
  end
end
