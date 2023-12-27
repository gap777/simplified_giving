FactoryBot.define do
  factory :gift_exchange do
    owner { association :user }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    event_date { Faker::Date.forward(days: 30) }
  end
end
