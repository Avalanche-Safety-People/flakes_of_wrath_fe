require 'rails_helper'

RSpec.describe 'User dashboard/show page' do
  describe 'happy path' do 
    it 'I see the user name' do
      sample_user_data = {
        data: 
          {
          id: 1,
          type: 'user',
          attributes: {
            name: 'User Name',
            favorite_zone: 'West north'
          }
        }
      }
      user = User.new(sample_user_data)
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
      # session[:user_id] = user.id
      visit users_path
      expect(page).to have_content(user.name)
    end
  end
end