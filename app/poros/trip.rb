class Trip
  attr_reader :start_date,
              :end_date,
              :name,
              :description,
              :zone_id,
              :zone_name

  def initialize(trip_data)
    @id = trip_data[:id]
    @start_date = trip_data[:attributes][:start_date]
    @end_date = trip_data[:attributes][:end_date]
    @name = trip_data[:attributes][:name]
    @description = trip_data[:attributes][:description]
    @zone_id = trip_data[:attributes][:zone_id]
    @zone_name = trip_data[:attributes][:zone_name]
  end 

end