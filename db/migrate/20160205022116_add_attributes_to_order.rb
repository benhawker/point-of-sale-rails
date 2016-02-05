class AddAttributesToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :customer_name, :string
  	add_column :orders, :total, :float, precision: 5, scale: 2, default: 0.0
  	add_column :orders, :status, :string, default: "pending"
  end
end
