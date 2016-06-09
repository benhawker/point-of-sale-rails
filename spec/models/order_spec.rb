require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:payments) }
  it { should have_many(:order_items) }
  it { should have_many(:products).through(:order_items) }
  it { should have_one(:invoice) }

  let(:customer) { FactoryGirl.create(:customer) }
  let(:order) { FactoryGirl.create(:order, customer: customer) }
  let(:order_item) { FactoryGirl.create(:order_item, product: product, order: order) }
  let(:order_item) { FactoryGirl.create(:order_item, product: product, order: order) }

  describe "#calculate_total" do
    it "calculates the correct total" do
      expect(order.calculate_total).to eq (123)
    end
  end

  describe "total_items" do
    it "caculates the total # of items in the order" do
      expect(order.total_items).to eq (2)
    end
  end

end
