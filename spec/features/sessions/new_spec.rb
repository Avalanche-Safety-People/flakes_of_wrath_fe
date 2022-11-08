require 'rails_helper'

RSpec.describe 'Landing page' do 
  describe 'When I visit the root path' do 
    describe 'And I am not logged in' do 
      it 'They should see a link to log in with Google button' do 
        visit login_path
        expect(page).to have_button('Log in with Google')
      end

      it 'They should see a link to the resources page' do 
        visit login_path
        click_link 'Resources'
        expect(current_path).to eq(resources_path)
      end

      it 'I see links to login' do 
        visit login_path
        expect(page).to have_button('Log in')
      end

      it 'I see a link to the forecast page', :vcr do 
        visit login_path 
        click_link 'Forecast'
        expect(current_path).to eq(areas_path)
      end
    end
  end
end