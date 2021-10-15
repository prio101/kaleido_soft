class Quiz < ApplicationRecord
  has_many  :questions
  
  enum difficulty: { easy: 0, hard: 1, hardest: 2 } 

  # validations
  validates_presence_of :topic, :questions_count, :correct_answer_reward, :difficulty
  validates_uniqueness_of  :topic
end
