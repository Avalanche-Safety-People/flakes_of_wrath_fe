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

  def flash_class(level)
    case level
        when 'notice' then "alert alert-primary"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-secondary"
    end
  end

end
