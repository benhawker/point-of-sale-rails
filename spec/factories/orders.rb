FactoryGirl.define do
  factory :order do
  	total 100
  	status "pending"
  	customer
  end
end