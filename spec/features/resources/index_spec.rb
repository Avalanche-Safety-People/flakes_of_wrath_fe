require 'rails_helper'

RSpec.describe 'Resources page' do 
  describe "when I visit '/resources'" do 
    it 'has a link to AIRE courses' do 
      visit resources_path
      expect(page).to have_button 'Find your forecast'
    end

    it 'Has a link to Avalanche.org to view forecasts' do 
      visit resources_path
      expect(page).to have_button 'Find a course'
    end

    it 'Has a link to online avalanche training at avalanche.ca' do 
      visit resources_path
      expect(page).to have_button 'Practice online'
    end
  end
end
