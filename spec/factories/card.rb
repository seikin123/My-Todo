FactoryBot.define do
  factory :card do
    id {1}
    user_id {1}
    title {"test"}
    
    trait :invalid do
      user_id {nil}
      title {nil}
    end
  end