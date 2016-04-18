require 'rails_helper'

feature "Orders" do

  let(:category) { FactoryGirl.create(:category, name: "Test Category") }
  let(:product) { FactoryGirl.create(:product) }
  let(:second_product) { FactoryGirl.create(:product, name: "Second Product") }

  it 'can create a new order', js: true do
    visit root_path
    click_link 'New Order'
    fill_in 'order[customer]',with: "My new category"
    click_button 'Create Category'
    expect(page).to have_content("My new category")
  end

end