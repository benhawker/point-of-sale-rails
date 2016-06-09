require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:payments) }
  it { should have_many(:order_items) }
  it { should have_many(:products).through(:order_items) }
  it { should have_one(:invoice) }

  let!(:order) { FactoryGirl.create(:order) }

  before do
    # Order items to be included in the count
    FactoryGirl.create(:order_item, order: order, quantity: 2)
    FactoryGirl.create(:order_item, order: order, quantity: 4)

    # Order items to not be included in the count
    FactoryGirl.create(:order_item, quantity: 4)
  end

  describe "#calculate_total" do
    it "calculates the `correct total" do
      order.calculate_total
      expect(order.total).to eq (30.0)
    end
  end

  describe "total_items" do
    it "caculates the total # of unique items in the order" do
      expect(order.total_items).to eq (6)
    end
  end

end
