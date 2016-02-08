class Payment < ActiveRecord::Base
	belongs_to :order

 # Association validations
  validates_presence_of :order

end
