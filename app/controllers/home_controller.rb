
class HomeController < ApplicationController
  def index
    @target = Target.new
    @target.user_id = session[:login_user_id]
    @current_user = User.find session[:login_user_id] if session[:login_user_id]
    if @current_user
      @statuses = Status.where(wb_uid: @current_user.target.wb_uid).order(posted_at: :desc).to_a
    end
  end
end
