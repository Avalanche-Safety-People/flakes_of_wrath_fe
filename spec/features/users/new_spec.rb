require 'rails_helper'

RSpec.describe 'New trip' do 
  describe 'When I visit a new user page' do 
    it 'I see my upcoming trips', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)

      visit new_users_trip_path
      expect(page).to have_content('Adventure is out there')
    end

    it 'When I fill out the form with valid data and click submit,
        I am redirected to the user home page where I see my new trip', :vcr do 
      bob = UserFacade.get_user(1)
      bobs_trips = UserFacade.user_trips(1)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(TripsController).to receive(:current_user).and_return(bob)
      allow_any_instance_of(TripsController).to receive(:user_trips).and_return(bobs_trips)
      bobs_new_trips = UserFacade.user_trips(1)
      allow_any_instance_of(UsersController).to receive(:user_trips).and_return(bobs_new_trips)
      
      visit new_users_trip_path

      fill_in :name, with: 'Avalanche Mountain'
      select 'Snoqualmie Pass', from: :zone_id
      fill_in :start_date, with: '30/12/2023'
      fill_in :description, with: 'Head over the Snoqualmie Mt Notch, then climb the S ridge of Avalanche Mt'
      click_on 'Create'

      expect(current_path).to eq(users_path)
    end

    # create_table "trips", force: :cascade do |t|
    #   t.bigint "user_id"
    #   t.string "name"
    #   t.integer "zone_id"
    #   t.datetime "start_date"
    #   t.string "description"
    #   t.index ["user_id"], name: "index_trips_on_user_id"
    # end
  end
end