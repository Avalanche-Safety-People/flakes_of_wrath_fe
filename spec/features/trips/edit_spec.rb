require 'rails_helper'

RSpec.describe 'Trip Update' do
 it 'has a link to update your trips on the trips show page' do
   bob = UserFacade.get_user(1)
   bobs_trips = UserFacade.user_trips(1)
   first_trip = bobs_trips[0]
   allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
   allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
   allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

   visit users_trip_path(first_trip.id)
   
   expect(page).to have_link("Edit #{first_trip.name}")
 end

 it 'When I click the link I am taken to a page with a form to update my trip' do
  bob = UserFacade.get_user(1)
   bobs_trips = UserFacade.user_trips(1)
   first_trip = bobs_trips[0]
   allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
   allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
   allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

   visit users_trip_path(first_trip.id)
   
   click_link "Edit #{first_trip.name}"
   expect(current_path).to eq(edit_users_trip_path(first_trip.id))

   expect(page).to have_content("Edit #{first_trip.name} Trip")
 end

 it 'When I fill in the edit form for my trip and click update I am redirected to the trip show page with updated info' do
   bob = UserFacade.get_user(1)
   bobs_trips = UserFacade.user_trips(1)
   first_trip = bobs_trips[0]
   allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
   allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
   allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

   visit users_trip_path(first_trip.id)
   
   click_link "Edit #{first_trip.name}"
   expect(current_path).to eq(edit_users_trip_path(first_trip.id))
   visit edit_users_trip_path(first_trip.id)

   fill_in :name, with: "Heli-skiing nerds"
   fill_in :description, with: "We're jumping out of helicopters now!"

   click_on "Update"

   expect(current_path).to eq(users_trip_path(first_trip.id))
  
   updated_trip = UserFacade.user_trips(1)

   expect(updated_trip[0].name).to eq("Heli-skiing nerds")
   expect(updated_trip[0].description).to eq("We're jumping out of helicopters now!")
 end

 it 'can update bobs updated trip back to the original befoe the update' do
   bob = UserFacade.get_user(1)
   bobs_trips = UserFacade.user_trips(1)
   first_trip = bobs_trips[0]
   allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
   allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
   allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

   visit users_trip_path(first_trip.id)
   
   click_link "Edit #{first_trip.name}"
   expect(current_path).to eq(edit_users_trip_path(first_trip.id))
   visit edit_users_trip_path(first_trip.id)

   fill_in :name, with: "Adventure is out there"
   fill_in :description, with: "very moist"

   click_on "Update"

   expect(current_path).to eq(users_trip_path(first_trip.id))
  
   updateded_trip = UserFacade.user_trips(1)

   expect(updateded_trip[0].name).to eq("Adventure is out there")
   expect(updateded_trip[0].description).to eq("very moist")
 end
end