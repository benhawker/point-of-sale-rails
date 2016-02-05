class Product < ActiveRecord::Base
	belongs_to :category



	def in_stock?
		self.in_stock
	end

end
