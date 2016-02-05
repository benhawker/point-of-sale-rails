class AddStockQuantityToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :stock_quantity, :integer, default: 0, null: false
  end
end
