class Question < ApplicationRecord
  belongs_to :quiz

  def valid_limit?
    count = Question.where(quiz_id: quiz_id).count
    limit = Quiz.find(quiz_id).questions_count
    count < limit
  end
end
