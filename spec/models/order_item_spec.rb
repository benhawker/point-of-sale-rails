require 'rails_helper'

describe OrderItem do
  it { should belong_to(:product) }
  it { should belong_to(:order) }

  it { should validate_presence_of(:product) }
  it { should validate_presence_of(:order) }

  let(:order_item) { FactoryGirl.create(:order_item) }

  describe "#calculate_total" do
    it "should caculate the ocrrect total for each order item" do
      expect(order_item.calculate_total).to eq (10.0)
    end
  end
end