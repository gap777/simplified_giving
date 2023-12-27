FactoryBot.define do
  factory :gift_exchange do
    owner { association :user }
    name { Faker::Lorem.word }
  end
end
