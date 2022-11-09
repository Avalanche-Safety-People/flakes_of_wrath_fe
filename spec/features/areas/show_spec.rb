require 'rails_helper'

RSpec.describe 'Area Show Page' do
  describe "As a User, when I visit the area show page" do
    it 'displays relevant information for the zone', :vcr do

      area = AreaFacade.find_zone(419)
      visit area_path(419)

      expect(page).to have_content "Olympics"
      expect(page).to have_content area.description
      expect(page).to have_content area.current_av_risk_string
      expect(page).to have_content area.start_date
      expect(page).to have_content area.av_forecast_string[1]
      expect(page).to have_content area.av_forecast_string[2]
      expect(page).to have_link "Check the NWAC forecast"
    end
  end
end
