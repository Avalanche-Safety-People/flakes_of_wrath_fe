require 'rails_helper'

RSpec.describe 'Landing page' do 
  describe 'When I visit the root path' do 
    describe 'And I am not logged in' do 
      it 'They should see a link to log in with Google button' do 
        visit login_path
        expect(page).to have_button('Log in with Google')
      end

      it 'They should see a link to Avalanche.org' do 
        visit login_path
        href = "https://avalanche.org"
        expect(page).to have_selector "a[href='#{href}']", text: 'View avalanche forecast on Avalanche.org'
      end
    end
  end
end