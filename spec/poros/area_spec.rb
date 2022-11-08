require 'rails_helper'

describe 'Area PORO Spec', type: :model do
  let(:area1) { build(:area) }

  it 'has trip attributes' do
    expect(area1.id).to be_a(Integer)
    expect(area1.start_date).to be_a(Date)
    expect(area1.end_date).to be_a(Date)
    expect(area1.description).to be_a(String)
    expect(area1.current_av_risk).to be_a(Integer)
    expect(area1.av_danger).to be_a(Array)
    expect(area1.state).to be_a(String)
    expect(area1.name).to be_a(String)
    expect(area1.url).to be_a(String)
    expect(area1.lat).to be_a(Float)
    expect(area1.long).to be_a(Float)
  end
end