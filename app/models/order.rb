class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :products
	has_many :payments
end
