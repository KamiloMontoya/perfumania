class AddNoteToProductsTable < ActiveRecord::Migration
  def change
  	add_column :products, :note_id, :integer
  end
end
