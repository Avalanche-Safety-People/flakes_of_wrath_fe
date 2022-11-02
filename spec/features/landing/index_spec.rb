require 'rails_helper'

RSpec.describe 'Landing page' do 
  describe 'When I visit the root path' do 
    describe 'And I am not logged in' do 
      it 'They should see a link to log in with Google button' do 
        # allow_any_instance_of(<controller>).to receive(response).and_return(accepted)
        visit root_path
        expect(page).to have_button('Log in with Google')
        click_button 'Log in with Google'
        expect(current_path).to eq(user_dashboard_path)
      end
    end
  end
end