FactoryBot.define do
  factory :area do
    area_data = {
      id: 427,
      attributes: {
        start_date: Date.today.to_s,
        end_date: 1.days.from_now.to_s,
        name: Faker::Creature::Bird.common_family_name,
        travel_advice: Faker::Creature::Bird.color,
        state: 'WA',
        url: 'http://www.nwac.us/avalanche-forecast/#/snoqualmie-pass',
        current_av_risk: -1,
        av_danger: [-1, 1, 1, 1, 1, 1, 1, 1],
        lat_long: [46.61, -121.66]
      }
    }
    initialize_with { new(area_data) }
  end
end