require 'rails_helper'

describe 'Trip PORO Spec', type: :model do
  let(:trip1) { build(:trip) }

  it 'has trip attributes' do
    expect(trip1.id).to be_a(Integer)
    expect(trip1.start_date).to be_a(Date)
    expect(trip1.name).to be_a(String)
    expect(trip1.description).to be_a(String)
    expect(trip1.zone_id).to be_a(Integer)
  end
end