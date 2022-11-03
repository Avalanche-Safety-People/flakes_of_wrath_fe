class User
  attr_reader :name, :favorite_zone

  def initialize(user_data)
    @name = user_data[:data][:attributes][:name]
    @favorite_zone = user_data[:data][:attributes][:favorite_zone]
  end
end