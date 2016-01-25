
class HomeController < ApplicationController
  def index
    @current_user = User.find session[:login_user_id] if session[:login_user_id]
    @target = Target.new
    @target.user_id = session[:login_user_id]
  end
end
