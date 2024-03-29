require 'rails_helper'

RSpec.describe 'User Profile page' do
  describe 'happy path' do
    it 'will have a drop-down menu to update favorite zone', :vcr do
      bob = UserFacade.get_user(1)
      original_fav = bob.favorite_zone
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_trips)

      visit edit_users_path

      expect(page).to have_content('Favorite Zone')
      expect(page).to have_content('Emergency Contacts')

      within '.zone' do
        expect(bob.favorite_zone).to eq(original_fav)
        expect(page).to have_select('favorite_zone')
        select('Olympics', from: :favorite_zone)
        click_on 'Update'
        updated_bob = UserFacade.get_user(1)
        expect(updated_bob.favorite_zone).to eq(1128)
      end
    end

    it 'will have a list of emergency contacts for the user', :vcr do
      bob = UserFacade.get_user(1)
      bobs_contacts = UserFacade.emergency_contacts(bob.id)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)

      visit edit_users_path

      within '.contacts' do
        bobs_contacts.each do |contact|
          expect(page).to have_content(contact.name)
          expect(page).to have_content(contact.phone_number)
        end
      end
    end

    it 'will have an option to add, update or edit current contacts', :vcr do
      bob = UserFacade.get_user(1)
      bobs_contacts = UserFacade.emergency_contacts(bob.id)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)

      visit edit_users_path

      within '.contacts' do
        expect(page).to have_button('Edit')
        expect(page).to have_button('Delete')
        expect(page).to have_button('Add an Emergency Contact')
      end
    end

    it 'will send you to an edit existing emergency contact page', :vcr do
      bob = UserFacade.get_user(1)
      bobs_contacts = UserFacade.emergency_contacts(bob.id)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(EmergencyContactsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(EmergencyContactsController).to receive(:current_user).and_return(bob)

      bobs_contacts.each do |contact|
        visit edit_users_path
        within "#one_contact-#{contact.id}" do
          click_button "Edit"
          expect(current_path).to eq(edit_users_emergency_contact_path(contact.id))
        end
      end
    end
  end
end