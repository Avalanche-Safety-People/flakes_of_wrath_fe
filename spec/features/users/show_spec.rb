require 'rails_helper'

RSpec.describe 'User dashboard/show page' do
  describe 'happy path' do 
    it 'I see the user name and favorite zone', :vcr do
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)

      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      expect(page).to have_content(bob.name)
    end

    it 'I see the trips the user is going on', :vcr do
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)

      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      expect(page).to have_content('Adventure is out there')
      expect(page).to have_content('Prom Night!')
    end

    it 'I see a button to add a new trip', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)

      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      click_button 'Add a new trip'
      expect(current_path).to eq(new_users_trip_path)
    end

    it 'Each trip is a link to the show page for that trip', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)

      allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      click_link 'Adventure is out there'
      expect(current_path).to eq(users_trip_path(bobs_trips.first.id))
    end
  end
  describe 'nav bar' do 
    it 'They should see a link to the resources page', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      click_link 'Resources'
      expect(current_path).to eq(resources_path)
    end

    it 'I see links to log out', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)

      visit users_path
      expect(page).to have_button('Log Out')
    end

    it 'I see a link to the forecast page', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)

      visit users_path
      click_link 'Forecast'
      expect(current_path).to eq(areas_path)
    end

    it 'I see a link to my profile', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      
      allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)

      visit users_path
      click_on 'Profile'
      expect(current_path).to eq(edit_users_path)
    end
  end
end