require 'rails_helper'

RSpec.describe EmergencyContact do
  it 'can pull the info needed to make an object from the API return' do
    emergency_contact = {id: "1",
            type: "emergency_contact",
            attributes: {
              name: "mommy",
              phone_number: "1 800 588 2300",
              user_id: 1
            }}

    result = EmergencyContact.new(emergency_contact)

    expect(result).to be_an_instance_of(EmergencyContact)
    expect(result.id).to eq("1")
    expect(result.name).to eq("mommy")
    expect(result.phone_number).to eq("1 800 588 2300")
    expect(result.user_id).to eq 1
  end
end