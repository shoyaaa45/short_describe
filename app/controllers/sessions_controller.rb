class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:nick_name] = user.nickname
    session[:image_url] = user.image_url
    redirect_to root_path, notice: 'ログインしました。'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
