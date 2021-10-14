class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string  :topic
      t.integer :questions_count
      t.boolean :published, default: true
      t.decimal :correct_answer_reward

      t.index :topic, unique: true
      t.timestamps
    end
  end
end
