FactoryBot.define do
  factory :wish_list do
    participant { association :user }
    gift_exchange { association :gift_exchange }
  end
end
