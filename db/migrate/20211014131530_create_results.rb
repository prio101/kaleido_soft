class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.decimal :result
      t.text  :feedback
      
      t.references  :users
      t.references  :quizzes
      t.timestamps
    end
  end
end
