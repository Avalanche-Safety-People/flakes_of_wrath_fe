require 'rails_helper'

describe 'Student PORO Spec', type: :model do
  let(:user1) { build(:user) }
    it 'has user attributes' do
      expect(user1).to respond_to(:id, :name)
    end
end