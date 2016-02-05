class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :payments
	has_many :order_items
	has_many :products, through: :order_items
end
