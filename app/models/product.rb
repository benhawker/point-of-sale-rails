class Product < ActiveRecord::Base
	##Associations
	belongs_to :category



  ## Class Methods
	def in_stock?
		self.in_stock
	end

end
