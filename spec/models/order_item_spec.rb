require 'rails_helper'

describe OrderItem do
	it { should belong_to(:product) }
	it { should belong_to(:order) }
end