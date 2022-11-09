require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    it '#.find_or_create_user' do
      user = {
        data: {
          id: "3",
          type: "user",
          attributes: {
            name: "Gavin Carew",
            favorite_zone: 'nil'
          }
        }
      }
      expect(user).to be_a Hash
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:attributes]).to be_a Hash
      expect(user[:data][:attributes][:name]).to be_a String
    end

    it '.get_user', :vcr do
      user = UserService.get_user(1)

      expect(user).to be_a Hash
      expect(user[:data][:type]).to eq('user')
    end

    it '#.trips', :vcr do
      trips = UserService.trips(1)
      expect(trips).to be_a Hash
      expect(trips[:data]).to be_a Array
      expect(trips[:data].first[:attributes]).to have_key(:start_date)
      expect(trips[:data].first[:attributes]).to have_key(:name)
      expect(trips[:data].first[:attributes]).to have_key(:description)
      expect(trips[:data].first[:attributes]).to have_key(:user_id)
    end

    it '#update_user', :vcr do
      update_params = {id: 1, favorite_zone: 430}

      updated_user = UserService.update_user(update_params)

      expect(updated_user).to be_a Hash
      expect(updated_user[:data]).to have_key(:id)
      expect(updated_user[:data][:id]).to be_a String
      expect(updated_user[:data]).to have_key(:type)
      expect(updated_user[:data][:type]).to be_a String
      expect(updated_user[:data]).to have_key(:attributes)

      expect(updated_user[:data][:attributes]).to have_key(:name)
      expect(updated_user[:data][:attributes][:name]).to be_a String

      expect(updated_user[:data][:attributes]).to have_key(:favorite_zone)
      expect(updated_user[:data][:attributes][:favorite_zone]).to be_a Integer
    end

    it '#all_emergency_contacts', :vcr do
      bob = UserFacade.get_user(1)
      bobs_contacts = UserService.all_emergency_contacts(bob.id)

      expect(bobs_contacts).to be_a Hash
      expect(bobs_contacts[:data]).to be_a Array

      bobs_contacts[:data].each do |contact|
        expect(contact).to have_key(:id)
        expect(contact[:id]).to be_a String

        expect(contact).to have_key(:type)
        expect(contact[:type]).to be_a String

        expect(contact).to have_key(:attributes)
        expect(contact[:attributes]).to have_key(:name)
        expect(contact[:attributes][:name]).to be_a String

        expect(contact[:attributes]).to have_key(:phone_number)
        expect(contact[:attributes][:phone_number]).to be_a String

        expect(contact[:attributes]).to have_key(:user_id)
        expect(contact[:attributes][:user_id]).to be_a Integer
      end
    end

    it '#one_emergency_contact', :vcr do
      bob = UserFacade.get_user(1)
      contact = UserFacade.emergency_contacts(bob.id).first
      retrieved_contact = UserService.one_emergency_contact(bob.id, contact.id)
      expect(retrieved_contact).to be_a Hash

      expect(retrieved_contact[:data][:id]).to eq(contact.id)
      expect(retrieved_contact[:data][:attributes][:user_id]).to eq(bob.id.to_i)
    end

    it '#update_one_contact', :vcr do
      bob = UserFacade.get_user(1)
      contact = UserFacade.emergency_contacts(bob.id).first
      update_params = {user_id: bob.id, id: contact.id, name: 'Not the one'}
      updated_contact = UserService.update_one_contact(update_params)

      expect(updated_contact).to be_a Hash
      expect(updated_contact[:data][:id]).to eq(contact.id)
      expect(updated_contact[:data][:attributes][:name]).to eq(update_params[:name])
      expect(updated_contact[:data][:attributes][:user_id]).to eq(bob.id.to_i)
    end
  end
end
