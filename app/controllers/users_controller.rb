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
    response = UserService.update_user(params)
    if response.success?
      redirect_to edit_users_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  private

  def user_trips
    @user_trips = UserFacade.user_trips(session[:user_id])
  end
end
