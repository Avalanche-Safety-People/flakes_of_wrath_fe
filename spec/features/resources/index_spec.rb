require 'rails_helper'

RSpec.describe 'Resources page' do 
  describe "when I visit '/resources'" do 
    it 'has a link to AIRE courses' do 
      visit resources_path
      href = "https://avtraining.org/upcoming-public-avalanche-training-courses/"
      expect(page).to have_selector "a[href='#{href}']", text: 'Find upcoming AIARE courses near you'
    end

    it 'Has a link to Avalanche.org to view forecasts' do 
      visit resources_path
      href = "https://avalanche.org"
      expect(page).to have_selector "a[href='#{href}']", text: 'View detailed avalanche forecasts on Avalanche.org'
    end

    it 'Has a link to online avalanche training at avalanche.ca' do 
      visit resources_path
      href = "https://avysavvy.avalanche.ca/en-ca/"
      expect(page).to have_selector "a[href='#{href}']", text: 'Get online training at Avalanche.ca'
    end

    it 'Has a link to view weather forecasts'
  end
end
