module ApplicationHelper

  def avalanche_zones
    [
      ['Olympics', 419],
      ['West Slopes North', 420],
      ['West Slopes Central', 421],
      ['West Slopes South', 422],
      ['Stevens Pass', 423],
      ['Snoqualmie Pass', 427],
      ['East Slopes North', 428],
      ['East Slopes Central', 429],
      ['East Slopes South', 430],
      ['Mt Hood', 431]
    ]
  end

  def user_trips
    UserFacade.user_trips(session[:user_id])
  end

end
