module ApplicationHelper

  def avalanche_zones
    [
      ['Olympics', 1128],
      ['West Slopes North', 1129],
      ['West Slopes Central', 1130],
      ['West Slopes South', 1131],
      ['Stevens Pass', 1132],
      ['Snoqualmie Pass', 1136],
      ['East Slopes North', 1137],
      ['East Slopes Central', 1138],
      ['East Slopes South', 1139],
      ['Mt Hood', 1140]
    ]
  end

  def user_trips
    UserFacade.user_trips(session[:user_id])
  end

  def zone_id_to_name(zone_id)
    {
      1128 => 'Olympics',
      1129 => 'West Slopes North',
      1130 => 'West Slopes Central',
      1131 => 'West Slopes South',
      1132 => 'Stevens Pass',
      1136 => 'Snoqualmie Pass',
      1137 => 'East Slopes North',
      1138 => 'East Slopes Central',
      1139 => 'East Slopes South',
      1140 => 'Mt Hood',
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
