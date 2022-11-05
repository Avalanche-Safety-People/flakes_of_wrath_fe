class Trip
  attr_reader :start_date,
              :name,
              :description,
              :zone_id,
              :id,
              :user_id

  def initialize(trip_data)
    # binding.pry
    @id = trip_data[:id]
    @start_date = trip_data[:attributes][:start_date]
    @name = trip_data[:attributes][:name]
    @description = trip_data[:attributes][:description]
    @zone_id = trip_data[:attributes][:zone_id]
    @user_id = trip_data[:attributes][:user_id]
  end 

end