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
      expect(page).to have_content(bob.favorite_zone)
    end

    xit 'I see the trips the user is going on', :vcr do
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)

      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit users_path
      expect(page).to have_content('Adventure is out there')
      expect(page).to have_content('Prom Night!')

      # expect(page).to have_content('')
      # expect(page).to have_content()
    end
  end
end