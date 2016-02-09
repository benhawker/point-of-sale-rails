class OrderItem < ActiveRecord::Base
	belongs_to :order
  belongs_to :product

 	accepts_nested_attributes_for :order, allow_destroy: true

  # Association validations
  validates_presence_of :product

  # Attribute validations
  validates_presence_of :quantity, message: "Please enter a quantity"


	def calculate_total
		total = 0.0
		total = self.product.price * self.quantity
	end

end
