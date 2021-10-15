class AddDifficultyToQuizesTable < ActiveRecord::Migration[6.0]
  def change
    add_column  :quizzes, :difficulty, :integer, limit: 8 
  end
end
