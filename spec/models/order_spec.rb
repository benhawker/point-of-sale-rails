require 'rails_helper'

RSpec.describe Order, type: :model do
	it { should belong_to(:customer) }
  it { should have_many(:products) }
  it { should have_many(:payments) }
end