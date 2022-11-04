require 'rails_helper'

RSpec.describe UserService do 
  describe 'class methods' do 
    it '#.find_or_create_user' do 
      user = {:data=>{:id=>"3", :type=>"user", :attributes=>{:name=>"Gavin Carew", :favorite_zone=>nil}}}
      expect(user).to be_a Hash
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:attributes]).to be_a Hash
      expect(user[:data][:attributes][:name]).to be_a String
    end

    it '#.trips' do 
      trips = {data: [
          { id: 1,
            attributes: {
              start_date: Date.new(2023, 03, 05),
              end_date: Date.new(2023, 03, 05),
              name: 'Backcountry skiing',
              description: 'Going to Mt Herman',
              zone_id: 3,
              zone_name: 'West North',
              user_id: 4
            }
          },
          { id: 1,
            attributes: {
              start_date: Date.new(2023, 03, 05),
              end_date: Date.new(2023, 03, 05),
              name: 'Backcountry skiing',
              description: 'Going to Mt Herman',
              zone_id: 3,
              zone_name: 'West North',
              user_id: 4
            }
          }
        ]
      }
      expect(trips).to be_a Hash
      expect(trips[:data]).to be_a Array
      # require 'pry';binding.pry
      expect(trips[:data].first[:attributes]).to have_key(:start_date)
      expect(trips[:data].first[:attributes]).to have_key(:end_date)
      expect(trips[:data].first[:attributes]).to have_key(:name) 
      expect(trips[:data].first[:attributes]).to have_key(:description)
      expect(trips[:data].first[:attributes]).to have_key(:user_id) 
    end
  end
end