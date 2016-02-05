class Product < ActiveRecord::Base
	##Associations
	belongs_to :category


  #Search
  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end

  ## Class Methods
	def in_stock?
		self.in_stock
	end

end
