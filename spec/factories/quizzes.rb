FactoryBot.define do
  factory :quiz do
    topic { Faker::Ancient.titan }
    questions_count { 2 }
    correct_answer_reward { 10 }
  end
end
