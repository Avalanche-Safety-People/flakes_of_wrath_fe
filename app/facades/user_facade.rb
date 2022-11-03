class UserFacade
  def self.get_user(user_id)
    user_data ||= UserService.find_or_create_user(user_id)
    User.new(user_data)
  end

  def self.user_trips(user_id)
    trips = UserService.trips(user_id)
    trips.each do |trip_data|
      Trip.new(trip_data)
    end
  end

end