class EmergencyContactsController < ApplicationController

  def edit
    @user = current_user
    @contact = UserFacade.one_contact(@user.id, params[:id])
  end

  def update
    response = UserFacade.update_one_contact(params)
    if !response.nil?
      flash[:success] = 'Emergency Contact updated'
      @contact = response
      redirect_to edit_users_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end
end



