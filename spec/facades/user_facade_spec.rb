require 'rails_helper'

RSpec.describe UserFacade do
  describe 'class methods' do
    it '#.get_user', :vcr do
      user = UserFacade.get_user(1)
      expect(user).to be_a User
    end

    it '#.user_trips', :vcr do
      trips = UserFacade.user_trips(1)
      expect(trips).to be_an Array
      expect(trips).to all(be_a Trip)
    end

    it '#.emergency_contacts', :vcr do
      contacts = UserFacade.emergency_contacts(1)

      expect(contacts).to be_a Array
      expect(contacts).to all(be_a EmergencyContact)
    end

    it '#one_contact', :vcr do
      contact = UserFacade.one_contact(1, 1)

      expect(contact).to be_a EmergencyContact
    end

  end
end
