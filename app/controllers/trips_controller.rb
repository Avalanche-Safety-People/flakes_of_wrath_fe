class TripsController < ApplicationController
  before_action :logged_in_user
  include ApplicationHelper
  
  def new
  end

  def show
    @trips = user_trips
  end
end