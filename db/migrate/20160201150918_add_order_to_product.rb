class AddOrderToProduct < ActiveRecord::Migration
  def change
  	add_reference :products, :order, index: true, foreign_key: true
  end
end
