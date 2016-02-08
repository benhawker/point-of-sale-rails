class AddQuantityToOrderItem < ActiveRecord::Migration
  def change
  	add_column :order_items, :quantity, :integer, default: 1, null: false
  end
end
