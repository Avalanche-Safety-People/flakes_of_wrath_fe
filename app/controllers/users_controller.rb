class UsersController < ApplicationController
  before_action :logged_in_user, only: :show

  def show
    @user = current_user
    @trips = user_trips

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.favorite_zone = params[:favorite_zone]
  end

  private

  def user_trips
    @user_trips = UserFacade.user_trips(session[:user_id])
  end
end
