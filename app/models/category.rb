class Category < ActiveRecord::Base
	has_many :products

  # Attribute validations
  validates_presence_of :name, message: "Please add a name."

end
