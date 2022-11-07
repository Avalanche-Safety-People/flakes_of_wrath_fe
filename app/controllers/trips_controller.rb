class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper

  def new
    @user_trips = user_trips
    @user = current_user
  end

  def edit
    
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
    @trip = @user_trips.select do |trip| #does this make two calls???
      trip.id == params[:id].to_i
    end[0]
  end
end