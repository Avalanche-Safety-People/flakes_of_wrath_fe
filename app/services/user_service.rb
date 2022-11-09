class UserService
  def self.find_or_create_user(oauth_params)
    response = conn.get('/api/v1/users') do |request|
      request.body = oauth_params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user(user_id)
    response = conn.get("/api/v1/users/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.trips(user_id)
    response = conn.get("/api/v1/users/#{user_id}/trips")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_trip(params)
    response = conn.patch("/api/v1/users/#{params[:user_id]}/trips/#{params[:id]}") do |request|
      request.params = params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_user(params)
    response = conn.patch("/api/v1/users/#{params[:id]}") do |request|
      request.params = params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_trip(trip_params)
    conn.post("/api/v1/users/#{trip_params[:user_id]}/trips") do |req|
      req.params = trip_params
    end
  end

  def self.all_emergency_contacts(user_id)
    response = conn.get("/api/v1/users/#{user_id}/emergency_contacts")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.one_emergency_contact(user_id, contact_id)
    response = conn.get("/api/v1/users/#{user_id}/emergency_contacts/#{contact_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_one_contact(params)
    response = conn.patch("/api/v1/users/#{params[:user_id]}/emergency_contacts/#{params[:id]}") do |req|
      req.params = params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
      Faraday.new(url: 'http://localhost:5000/')
    else
      Faraday.new(url: 'https://flakes-of-wrath-be.herokuapp.com/')
    end
  end
end
