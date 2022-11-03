FactoryBot.define do
  factory :trip do
    trip_data = {
      id: Faker::Number.number(digits: 5),
      attributes: {
        start_date: Faker::Date.between(from: Date.today, to: 5.days.from_now),
        end_date: 5.days.from_now,
        name: Faker::Creature::Bird.common_family_name,
        description: Faker::Creature::Bird.color,
        zone_id: Faker::Number.number(digits: 5),
        zone_name: Faker::Games::Pokemon.location
      }
    }

    initialize_with { new(trip_data) }
  end
end