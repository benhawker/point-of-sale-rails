class AddAttributesToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :name, :string, null: false
  	add_column :customers, :email, :string, null: false
  	add_column :customers, :type, :string
  end
end
