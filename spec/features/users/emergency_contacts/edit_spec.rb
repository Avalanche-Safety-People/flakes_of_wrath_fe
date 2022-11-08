require 'rails_helper'

RSpec.describe 'Emergency User edit' do
  it 'can edit a users emergency contacts', :vcr do
    bob = UserFacade.get_user(1)
    bobs_contacts = UserFacade.emergency_contacts(bob.id)
    contact = bobs_contacts.first
    allow_any_instance_of(EmergencyContactsController).to receive(:logged_in_user).and_return(true)
    allow_any_instance_of(EmergencyContactsController).to receive(:current_user).and_return(bob)
    allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
    allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)

    visit edit_users_emergency_contact_path(contact.id)

    expect(page).to have_content(contact.name)
    expect(page).to have_button('Update')

    fill_in :name, with: 'Dad'
    click_on 'Update'
    expect(current_path).to eq(edit_users_path)
  end
end