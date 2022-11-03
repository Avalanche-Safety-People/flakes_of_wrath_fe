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
        click_link 'Avalanche safety resources'
        expect(current_path).to eq(resources_path)
      end
    end
  end
end