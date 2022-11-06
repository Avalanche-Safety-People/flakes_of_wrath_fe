require 'rails_helper'

RSpec.describe 'users profile page' do
  describe 'happy path' do
    it 'will have a drop-down menu to select favorite zone', :vcr do
      bob = UserFacade.get_user(1)
      first_fav = bob.favorite_zone
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit edit_users_path

      expect(page).to have_content('Favorite Zone')
      expect(page).to have_content('Emergency Contacts')

      within '.zone' do
        expect(bob.favorite_zone).to eq(first_fav)

        expect(page).to have_select('favorite_zone')
        select('Olympics', from: :favorite_zone)
        click_on 'Update'
        updated_bob = UserFacade.get_user(1)
        expect(updated_bob.favorite_zone).to eq(419)
      end
    end
  end
end