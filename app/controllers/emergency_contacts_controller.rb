class EmergencyContactsController < ApplicationController

  def edit
    @user = current_user
    @contact = UserFacade.one_contact(@user.id, params[:id])
  end

  def update
    # require 'pry' ; binding.pry
    # reponse = UserService.update_contact(params)
    # if response
    redirect_to edit_users_path
    # else
    #   flash[:error] = 'Something went wrong'
    #   render :edit
  end

  def destroy
    UserService.delete_contact(params[:id], params[:contact_id])
    if response.successful?
      flash[:success] = 'Emergency contact deleted'
      redirect_to edit_users_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end
end
