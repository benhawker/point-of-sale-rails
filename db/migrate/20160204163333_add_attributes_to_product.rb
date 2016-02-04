class AddAttributesToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :name, :string
  	add_column :products, :description, :string
  	add_column :products, :price, :float
  end
end
