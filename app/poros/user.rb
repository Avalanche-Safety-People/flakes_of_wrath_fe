class User
  attr_reader :name, :id
  attr_accessor :favorite_zone

  def initialize(user_data)
    # binding.pry
    @id = user_data[:data][:id]
    @name = user_data[:data][:attributes][:name]
    @favorite_zone = user_data[:data][:attributes][:favorite_zone]
  end
end