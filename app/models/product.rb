class Product < ActiveRecord::Base
	#Associations
	belongs_to :category
	has_many :order_items
  has_many :orders, through: :order_items
  has_one :invoice

  # Association validations
  validates_presence_of :category

  # Attribute validations
  validates_presence_of :name, message: "Please add a product name."
  validates_presence_of :description, message: "Please add a description."
  validates_presence_of :price, message: "Please add a price."

  #Search
  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end

  def in_stock_status
    self.in_stock ? "In Stock" : "Out of Stock"
  end

  ## Class Methods
	def in_stock?
		self.in_stock
	end

end
