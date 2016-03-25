class AddVideoPathToProductsTable < ActiveRecord::Migration
  def change
  	add_column :products, :video_path, :string
  end
end
