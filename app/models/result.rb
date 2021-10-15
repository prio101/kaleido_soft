class Result < ApplicationRecord
  belongs_to  :user, optional: true
  belongs_to  :quiz
end
