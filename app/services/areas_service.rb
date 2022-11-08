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
    if ENV['RAILS_ENV'] == 'development'
      Faraday.new(url: 'http://localhost:5000/')
    else
      Faraday.new(url: 'https://flakes-of-wrath-be.herokuapp.com/')
    end
  end

  # def is_dev
  #   if ENV['RAILS_ENV'] == 'development'
  #   end
  # end

  # def is_test?
  #   if ENV['RAILS_ENV'] == 'test'
  #   end
  # end
end
