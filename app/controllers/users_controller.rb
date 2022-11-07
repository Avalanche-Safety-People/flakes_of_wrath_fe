class UsersController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: :show

  def show
    @user = current_user
    @user_trips = user_trips
  end

  def edit
    @user = current_user
    @emergency_contacts = UserFacade.emergency_contacts(@user.id)
  end

  def update
    response = UserService.update_user(params)
    if !response.nil?
      redirect_to edit_users_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end
end
