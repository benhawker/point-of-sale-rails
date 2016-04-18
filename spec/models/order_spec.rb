require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:payments) }
  it { should have_many(:order_items) }
  it { should have_many(:products).through(:order_items) }
  it { should have_one(:invoice) }

  it { should validate_presence_of(:customer) }


  describe "#calculate_total" do
    it "calculates the correct total" do

    end
  end

  describe "#update_total" do
    it "updates the order total" do

    end
  end

end
