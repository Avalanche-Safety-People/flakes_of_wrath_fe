class UserService

  def self.create_user(id)
    response = conn.post("/api/v1/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_or_create_user(oauth_params)
    response = conn.post(""
  end

  private

  def self.conn
    Faraday.new(url: 'http://localhost:3000')
  end
end