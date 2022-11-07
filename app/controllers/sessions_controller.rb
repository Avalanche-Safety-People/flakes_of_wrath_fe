class SessionsController < ApplicationController
  def new 
    if logged_in?
      redirect_to users_path
    end
  end

  def create
    user = UserFacade.find_or_create_user(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to users_path
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
