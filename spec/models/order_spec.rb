require 'rails_helper'

RSpec.describe Order, type: :model do
	it { should belong_to(:customer) }
  it { should have_many(:payments) }
  it { should have_many(:order_items) }
  it { should have_many(:products).through(:order_items) }
end