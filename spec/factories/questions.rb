FactoryBot.define do
  factory :question do
    question { Faker::Lorem.sentence }
    options { { a: 'answer', b: 'wrong answer' } }
    correct_answer { 'answer' }
    association :quiz
  end
end
 