class AddReadColumnToContactTable < ActiveRecord::Migration
  def change
  	add_column :contacts, :read_contact, :boolean
  end
end
