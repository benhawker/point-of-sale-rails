FactoryGirl.define do
  factory :order_item do
    association :order
    association :product
    quantity 2
    product
  end
end