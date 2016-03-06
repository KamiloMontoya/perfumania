class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :category_id
      t.integer :segment_id
      t.string :image_path

      t.timestamps null: false
    end
  end
end
