class User
  attr_reader :name, :favorite_zone, :id

  def initialize(user_data)
    @id = user_data[:data][:id]
    @name = user_data[:data][:attributes][:name]
    @favorite_zone = user_data[:data][:attributes][:favorite_zone]
  end
end