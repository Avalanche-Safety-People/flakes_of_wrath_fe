FactoryBot.define do
  factory :user do
    data = {
        id: Faker::Number.number(digits: 5),
        attributes: {
          name: Faker::Fantasy::Tolkien.character,
          favorite_zone: Faker::Fantasy::Tolkien.location
        }
      }
    initialize_with { new(attributes) }
  end
end