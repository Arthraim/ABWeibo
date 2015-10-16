
class HomeController < ApplicationController
  def index
    @target = Target.new
    @target.user_id = session[:login_user_id]
  end
end
