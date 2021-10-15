class Question < ApplicationRecord
  belongs_to :quiz

  def valid_limit?
    count = self.where(quiz_id: self.quiz_id).count
    limit = Quiz.find(self.quiz_id).questions_count
    count < limit
  end
end
