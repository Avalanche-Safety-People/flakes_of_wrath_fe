require 'rails_helper'

describe 'Area PORO Spec', type: :model do
  let(:area1) { build(:area) }

  it 'has trip attributes' do
    expect(area1.id).to be_a(Integer)
    expect(area1.start_date).to be_a(Date)
    expect(area1.end_date).to be_a(Date)
    expect(area1.description).to be_a(String)
    expect(area1.current_av_risk).to be_a(Integer)
    expect(area1.current_av_risk_string).to be_a(String)
    expect(area1.av_danger).to be_a(Array)
    expect(area1.av_forecast_string).to be_an(Array)
    expect(area1.state).to be_a(String)
    expect(area1.name).to be_a(String)
    expect(area1.url).to be_a(String)
    expect(area1.lat).to be_a(Float)
    expect(area1.long).to be_a(Float)
  end


  describe "risk integer to string method (#risk_description)" do
    it 'can convert a avalanche danger rating to an understandable string' do
      expect(area1.risk_description(-1)).to eq "No Report"
      expect(area1.risk_description(1)).to eq "Low"
      expect(area1.risk_description(2)).to eq "Moderate"
      expect(area1.risk_description(3)).to eq "Considerable"
      expect(area1.risk_description(4)).to eq "High"
      expect(area1.risk_description(5)).to eq "Extreme"
    end
  end
end