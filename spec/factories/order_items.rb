FactoryGirl.define do
  factory :order_item do
  	quantity 2
  	product
  	order
  end
end