class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper

  def new
    @user_trips = user_trips
  end

  def show
    @user_trips = user_trips
    @trip = @user_trips.select do |trip| #does this make two calls???
      trip.id == params[:id]
    end[0]
  end
end