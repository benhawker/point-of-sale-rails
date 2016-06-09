FactoryGirl.define do
  factory :order do
    total 100
    status "pending"

    after(:build) do |order|
      order.customer ||= FactoryGirl.create(:customer)
    end
  end
end