class EditDescriptionProductsTable2 < ActiveRecord::Migration
  def change
  	change_column :products, :description, :text
  end
end