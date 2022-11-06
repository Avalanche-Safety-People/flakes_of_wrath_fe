FactoryBot.define do
  factory :trip do
    trip_data = {
      id: Faker::Number.number(digits: 5).to_s,
      attributes: {
        start_date: Faker::Date.between(from: Date.today, to: 5.days.from_now).to_s,
        name: Faker::Creature::Bird.common_family_name,
        description: Faker::Creature::Bird.color,
        zone_id: Faker::Number.number(digits: 3).to_s,
        user_id: Faker::Number.number(digits: 1).to_s
      }
    }

    initialize_with { new(trip_data) }
  end
end