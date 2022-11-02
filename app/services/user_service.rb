class UserService

  def self.create_user(id)
    response = conn.post("/api/v1/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_or_create_user(oauth_params)
    # This endpoint could change
    response = conn.get('/api/v1/users') do |request|
      request.body = oauth_params
    end
  end

  private

  def self.conn
    # Currently stubbed with localhost, will eventually need to hit Heroku
    Faraday.new(url: 'http://localhost:3000')
  end
end