class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper
  
  def new
    @user_trips = user_trips
  end

  def show
    @user_trips = user_trips
  end
end