require 'rails_helper'

RSpec.describe 'Landing page' do 
  describe 'When I visit the root path' do 
    describe 'And I am not logged in' do 
      it 'They should see a link to log in with Google button' do 
        # stub_request(:get, "http://127.0.0.1:58296/__identify__").
        #  with(
        #    headers: {
       	#   'Accept'=>'*/*',
       	#   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	#   'User-Agent'=>'Ruby'
        #    }).
        #  to_return(status: 200, body: "", headers: {})
        Capybara.current_driver = :selenium
        visit root_path
        save_and_open_page
        expect(page).to have_button('Log in with Google')
        # # click_button 'Log in with Google'
        # save_and_open_page
        # expect(current_path).to eq(user_dashboard_path)
      end
    end
  end
end