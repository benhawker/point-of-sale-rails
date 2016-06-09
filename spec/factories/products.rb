FactoryGirl.define do
  factory :product do
    association :category
    name           { Faker::Lorem.sentence }
    description    { Faker::Lorem.sentence }
    price          5
    in_stock       true
    stock_quantity 10

    after(:build) do |product|
      product.category ||= FactoryGirl.create(:category)
    end
  end
end