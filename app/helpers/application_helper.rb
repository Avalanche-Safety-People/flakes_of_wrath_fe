module ApplicationHelper

  def user_trips
    UserFacade.user_trips(session[:user_id])
  end

end
