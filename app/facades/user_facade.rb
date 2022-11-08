class UserFacade
  def self.find_or_create_user(oauth_data)
    user_data = UserService.find_or_create_user(oauth_data)
    User.new(user_data)
  end

  def self.get_user(user_id)
    user_data = UserService.get_user(user_id)
    User.new(user_data)
  end

  def self.user_trips(user_id)
    trips = UserService.trips(user_id)
    trips[:data].map do |trip_data|
      Trip.new(trip_data)
    end
  end


  def self.emergency_contacts(user_id)
    contacts = UserService.all_emergency_contacts(user_id)
    contacts[:data].map do |contact_data|
      EmergencyContact.new(contact_data)
    end
  end
end