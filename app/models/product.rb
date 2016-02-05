class Product < ActiveRecord::Base
	#Associations
	belongs_to :category
	has_many :order_items
  has_many :orders, through: :order_items

  #Search
  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end

  ## Class Methods
	def in_stock?
		self.in_stock
	end

end
