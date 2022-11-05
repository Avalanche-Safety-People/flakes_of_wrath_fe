require 'rails_helper'

RSpec.describe UserService do 
  describe 'class methods' do 
    it '#.find_or_create_user' do 
      user = {
        data: {
          id: "3",
          type: "user",
          attributes: {
            name: "Gavin Carew",
            favorite_zone: 'nil'
          }
        }
      }
      expect(user).to be_a Hash
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:attributes]).to be_a Hash
      expect(user[:data][:attributes][:name]).to be_a String
    end

    it '.get_user', :vcr do 
      user = UserService.get_user(1)
      expect(user).to be_a Hash
      expect(user[:data][:type]).to eq('user')
    end

    it '#.trips', :vcr do 
      trips = UserService.trips(1)
      expect(trips).to be_a Hash
      expect(trips[:data]).to be_a Array
      expect(trips[:data].first[:attributes]).to have_key(:start_date)
      expect(trips[:data].first[:attributes]).to have_key(:name) 
      expect(trips[:data].first[:attributes]).to have_key(:description)
      expect(trips[:data].first[:attributes]).to have_key(:user_id) 
    end
  end
end
