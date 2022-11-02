require 'rails_helper'

RSpec.describe 'User dashboard/show page' do
  describe 'happy path' do 
    it 'I see the user name' do
      user = User.create!(name: 'Jake')
      allow_any_instance_of(UsersController).to receive(:logged_in_user).and_return(true)
      allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
      # session[:user_id] = user.id
      visit users_path
      expect(page).to have_content(user.name)
    end
  end
end