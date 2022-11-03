class UsersController < ApplicationController
  before_action :logged_in_user, only: :show
  
  def show
    @user = current_user
    # @trips = user_trips
  end

  private

  def user_trips
    @user_trips = UserFacade.user_trips(session[:id])
  end
end
