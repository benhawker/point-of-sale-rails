FactoryGirl.define do
  factory :product do
  	association :category
  	name "Something"
  	description "Something"
  	price 5
  	in_stock true
  	stock_quantity 10
  end
end