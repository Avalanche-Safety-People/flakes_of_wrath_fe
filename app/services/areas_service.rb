class AreasService
  def self.zones
    response = conn.get("/api/v1/areas")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_zone(zone_id)
    response = conn.get("/api/v1/areas/#{zone_id}")
    JSON.parse(response.body, symbolize_names: true)
  end


private

  def self.conn
    if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
      Faraday.new(url: 'http://localhost:5000/')
    else
      Faraday.new(url: 'https://flakes-of-wrath-be.fly.dev')
    end
  end
end
