class EmergencyContact
  attr_reader :id,
              :name,
              :phone_number,
              :user_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @phone_number = data[:attributes][:phone_number]
    @user_id = data[:attributes][:user_id]
  end
end