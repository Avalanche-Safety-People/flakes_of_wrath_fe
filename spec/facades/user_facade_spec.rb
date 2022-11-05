require 'rails_helper'

RSpec.describe UserFacade do 
  describe 'class methods' do 
    it '#.get_user', :vcr do 
      user = UserFacade.get_user(1)
      expect(user).to be_a User
    end

    it '#.user_trips', :vcr do 
      trips = UserFacade.user_trips(1)
      expect(trips).to be_an Array
      expect(trips).to all(be_a Trip)
    end
  end
end
