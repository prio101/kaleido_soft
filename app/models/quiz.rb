class Quiz < ApplicationRecord
  has_many  :questions
  

  # validations
  validates_presence_of :topic, :questions_count, :correct_answer_reward
  validates_uniqueness_of  :topic
end
