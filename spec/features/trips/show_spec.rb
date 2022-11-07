require 'rails_helper'

RSpec.describe 'Trip Show Page' do
  describe 'happy path' do
    it "As a user I see a single Trip's attributes", :vcr do
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      first_trip = bobs_trips[0]

      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit users_trip_path(first_trip.id)

      within '.trip_details' do
        expect(page).to have_content(first_trip.name)
        expect(page).to have_content('February 03, 2023')
        expect(page).to have_content(first_trip.description)
        expect(page).to have_content(first_trip.zone_id)
      end
    end
  end

  describe 'sad path' do
    xit "redirect to user page if trip does not exist" do

    end
  end
end
