class CreateTestResponses < ActiveRecord::Migration
  def change
    create_table :test_responses do |t|
      t.string :name
      t.string :email
      t.integer :test_id
      t.binary :response

      t.timestamps null: false
    end
  end
end
