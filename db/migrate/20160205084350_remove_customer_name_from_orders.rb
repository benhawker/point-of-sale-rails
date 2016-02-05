class RemoveCustomerNameFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :customer_name, :string
  end
end
