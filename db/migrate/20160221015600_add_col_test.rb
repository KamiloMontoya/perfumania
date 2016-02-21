class AddColTest < ActiveRecord::Migration
  def change
  	add_column(:questions, :test_id, :integer)
  end
end
