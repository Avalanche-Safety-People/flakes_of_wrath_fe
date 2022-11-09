require 'rails_helper'

RSpec.describe 'Area Index Page' do
  describe "As a User, when I visit the area index page" do

    it "Displays a list of all avalanche zones for the state, including current avalanche danger", :vcr do
      areas = AreaFacade.all_zones

      visit areas_path
      expect(page).to have_content(areas.first.name)
      expect(page).to have_content(areas.last.name)
      expect(page).to have_content(areas.first.current_av_risk_string)
    end

    it "has links that direct you to a show page for the zone", :vcr do
      areas = AreaFacade.all_zones
      visit areas_path
      click_link areas.first.name
      expect(current_path).to eq(area_path(areas.first.id))
    end
  end
end
