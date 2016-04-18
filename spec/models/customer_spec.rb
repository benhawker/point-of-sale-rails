require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:orders) }

  it { should validate_presence_of(:name).with_message("Please add a name.") }
  it { should validate_presence_of(:email).with_message("Please add an email.") }
end
