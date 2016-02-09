class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :payments
	has_many :order_items
	has_many :products, through: :order_items
	has_one :invoice

	accepts_nested_attributes_for :order_items

 	# Association validations
  # validates_presence_of :customer

	def calculate_total
		total = 0.0
		self.order_items.each do |order_item|
			total += order_item.product.price * order_item.quantity
		end

		update_total(total)
	end

	def update_total(total)
		self.update(total: total)
	end

	def total_items
		total = 0
		self.order_items.each do |order_item|
			total += order_item.quantity
		end

		return total
	end

end
