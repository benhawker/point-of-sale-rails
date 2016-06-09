FactoryGirl.define do
  factory :order_item do
    # association :order
    # association :product
    quantity 2

    after(:build) do |order_item|
      order_item.order ||= FactoryGirl.create(:order)
      order_item.product ||= FactoryGirl.create(:product)
    end
  end
end