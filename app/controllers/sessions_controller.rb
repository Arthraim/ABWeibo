
class SessionsController < ApplicationController
  def weibo_create
    redirect_to WeiboOAuth2::Client.new.authorize_url
  end

  def weibo_callback
    token = WeiboOAuth2::Client.new.auth_code.get_token(params[:code])
    session[:login_user_id] = User.signup_with_weibo_token(token).id
    redirect_to '/'
  end

  def destroy
    session[:login_user_id] = nil
    redirect_to '/'
  end
end
