class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string  :question
      t.jsonb :options
      t.string  :correct_answer

      t.references  :quizzes
      t.timestamps
    end
  end
end
