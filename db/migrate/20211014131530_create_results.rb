class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.decimal :result
      t.text  :feedback
      
      t.references  :user
      t.references  :quiz
      t.timestamps
    end
  end
end
