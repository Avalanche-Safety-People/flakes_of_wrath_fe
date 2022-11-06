require 'rails_helper'

RSpec.describe 'New trip' do 
  describe 'When I visit a new user page' do 
    xit 'I see my upcoming trips' do 
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

    end
    xit 'When I fill out the form with valid data and click submit,
        I am redirected to the user home page where I see my new trip' do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)
      
      visit new_users_trip_path
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
    end
  end
end