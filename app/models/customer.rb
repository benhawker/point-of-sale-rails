class Customer < ActiveRecord::Base
	has_many :orders

  # Attribute validations
  validates_presence_of :name, message: "Please add a name."
  validates_presence_of :email, message: "Please add an email."
end
