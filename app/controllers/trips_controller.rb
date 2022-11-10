class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper

  def new
    @user_trips = user_trips
    @user = current_user
  end

  def edit
    @user = current_user
    @user_trips = user_trips
    @trip = @user_trips.select { |trip| trip.id == params[:id].to_i }[0]
  end

  def update
    @user_trips = user_trips
    @trip = @user_trips.select { |trip| trip.id == params[:id].to_i }[0]

    response = UserService.update_trip(params)
    if response != nil
      redirect_to users_trip_path(@trip.id)
    else
      redirect_to edit_users_trip_path(@trip.id)
      flash[:error] = 'Unable to update trip. Try Again.'
    end
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
    @area = AreaFacade.find_zone(@trip.zone_id)
  end
end
