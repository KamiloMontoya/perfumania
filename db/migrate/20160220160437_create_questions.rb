class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :type_question_id

      t.timestamps null: false
    end
  end
end
