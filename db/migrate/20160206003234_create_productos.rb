class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
