class AddOrderToInvoice < ActiveRecord::Migration
  def change
  	add_reference :invoices, :order, index: true, foreign_key: true
  end
end
