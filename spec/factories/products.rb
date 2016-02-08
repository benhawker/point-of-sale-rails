FactoryGirl.define do
  factory :product do
  	category
  	order

  	name "Something"
  	description "Something"
  	price 5
  	in_stock true
  	stock_quantity 10
  end
end