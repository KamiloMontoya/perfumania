class AddPositionToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :top_position, :integer
  end
end