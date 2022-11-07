require 'rails_helper'

RSpec.describe 'Trip Update' do
 it 'can update the zone, date, name, and description of a trip' do
   bob = UserFacade.get_user(1)
   bobs_trips = UserFacade.user_trips(1)
   first_trip = bobs_trips[0]
   allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
   allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
   allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

   visit users_trip_path(first_trip.id)

   expect(page).to have_link("Edit #{first_trip.name}")
   click_link "Edit #{first_trip.name}"
   expect(current_path).to eq(edit_users_trip_path(first_trip.id))
 end
end