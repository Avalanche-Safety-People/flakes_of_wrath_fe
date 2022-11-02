class SessionsController < ApplicationController
  def new 
  end

  def create
    # user = User.from_google(request.env['omniauth.auth'])
    require 'pry';binding.pry
    user = UserService.find_or_create_user(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to users_path
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
