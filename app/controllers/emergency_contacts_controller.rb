class EmergencyContactsController < ApplicationController

  def edit
    @user = current_user
    @contact = UserFacade.one_contact(@user.id, params[:id])
  end

  def new
    @user = current_user
  end

  def create
    response = UserService.create_emergency_contact(params)
    if response.success?
      redirect_to edit_users_path
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
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




