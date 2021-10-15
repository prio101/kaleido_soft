FactoryBot.define do
  factory :result do
    result { 100 }
    feedback { Faker::Lorem.sentence }
    association :user
    association :quiz
  end
end
