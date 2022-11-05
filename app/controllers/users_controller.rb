class UsersController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: :show
  
  def show
    @user = current_user
    @trips = user_trips
  end
end
