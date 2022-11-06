class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper
  
  def new
    @user_trips = user_trips
    @user = current_user
  end

  def create
    response = UserService.create_trip(params)
    if response.success?
      redirect_to users_path
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def show
    @user_trips = user_trips
  end
end