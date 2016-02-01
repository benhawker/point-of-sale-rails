class AddOrderToPayment < ActiveRecord::Migration
  def change
  	add_reference :payments, :order, index: true, foreign_key: true
  end
end
