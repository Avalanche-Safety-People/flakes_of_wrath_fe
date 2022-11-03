require 'rails_helper'

RSpec.describe 'User dashboard/show page' do
  describe 'happy path' do 
    it 'I see the user name and favorite zone' do
      sample_user_data = File.read('spec/fixtures/user.json')
      sample_trip_data = File.read('spec/fixtures/trips.json')
      user = User.new(JSON.parse(JSON.parse(sample_user_data), symbolize_names: true))

      trips = JSON.parse(JSON.parse(sample_trip_data), symbolize_names: true)[:data].map do |trip| 
        Trip.new(trip)
      end

      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(trips)

      visit users_path
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.favorite_zone)
    end

    it 'I see the trips the user is going on' do
      sample_user_data = File.read('spec/fixtures/user.json')
      sample_trip_data = File.read('spec/fixtures/trips.json')
      user = User.new(JSON.parse(JSON.parse(sample_user_data), symbolize_names: true))

      trips = JSON.parse(JSON.parse(sample_trip_data), symbolize_names: true)[:data].map do |trip| 
        Trip.new(trip)
      end
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(trips)

      visit users_path
      expect(page).to have_content(trips[0].name)
      expect(page).to have_content(trips[1].name)
      expect(page).to have_content(trips[0].start_date)
      expect(page).to have_content(trips[1].start_date)
      expect(page).to have_content(trips[0].end_date)
      expect(page).to have_content(trips[1].end_date)
    end
  end
end