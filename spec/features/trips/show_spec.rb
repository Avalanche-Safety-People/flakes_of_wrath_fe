require 'rails_helper'

RSpec.describe 'Trip Show Page' do
  describe 'happy path' do
    it "As a user I see a single Trip's attributes", :vcr do
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit users_trip_path(1)
      save_and_open_page
    end
  end
end