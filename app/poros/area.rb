require 'date'
class Area
  attr_reader :id, :name, :start_date, :end_date, :description, :current_av_risk, :av_danger, :state, :url, :lat, :long

  def initialize(area_data)
    @id = area_data[:id].to_i
    @start_date = Date.parse(area_data[:attributes][:start_date])
    @end_date = Date.parse(area_data[:attributes][:end_date])
    @name = area_data[:attributes][:name]
    @description = area_data[:attributes][:travel_advice]
    @current_av_risk = area_data[:attributes][:current_av_risk]
    @av_danger = area_data[:attributes][:av_danger]
    @state = area_data[:attributes][:state]
    @url = area_data[:attributes][:url]
    @lat = area_data[:attributes][:lat_long][0]
    @long = area_data[:attributes][:lat_long][1]
  end

  def current_av_risk_string
    risk_description(@current_av_risk)
  end

  def av_forecast_string
    @av_danger.map do |day|
      risk_description(day)
    end
  end


  def risk_description(risk_integer)
      risk_integer_to_string = {
        -1 => "No Report",
        1 => "Low",
        2 => "Moderate",
        3 => "Considerable",
        4 => "High",
        5 => "Extreme"
      }
      risk_integer_to_string[risk_integer]
  end
end