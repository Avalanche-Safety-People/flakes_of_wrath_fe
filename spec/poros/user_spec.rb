require 'rails_helper'

describe 'User PORO Spec', type: :model do
  let(:user1) { build(:user) }

  it 'has user attributes' do
    expect(user1.id).to be_a(Integer)
    expect(user1.name).to be_a(String)
    expect(user1.favorite_zone).to be_a(String)
  end
end