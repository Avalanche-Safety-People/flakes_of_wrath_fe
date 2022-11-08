require 'rails_helper'

RSpec.describe 'Area Show Page' do
  describe 'happy path' do
    it "As a User, when I visit the area show page", :vcr do
      # bob = UserFacade.get_user(1)
      # bobs_trips = UserFacade.user_trips(1)
      # first_trip = bobs_trips[0]
      # allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      # allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      # allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit area_path(419)
    end
  end
end
