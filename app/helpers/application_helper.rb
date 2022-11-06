module ApplicationHelper

  def user_trips
    UserFacade.user_trips(session[:user_id])
  end

  def zone_id_to_name(zone_id)
    {
      419 => 'Olympics',
      420 => 'West Slopes North',
      421 => 'West Slopes Central',
      422 => 'West Slopes South',
      423 => 'Stevens Pass',
      427 => 'Snoqualmie Pass',
      428 => 'East Slopes North',
      429 => 'East Slopes Central',
      430 => 'East Slopes South',
      431 => 'Mt Hood',
      88 => 'MT 88 [TEST]'
    }[zone_id]
  end

end
