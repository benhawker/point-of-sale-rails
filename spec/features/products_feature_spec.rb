require 'rails_helper'

feature "Products" do

	let!(:category) { Category.create(name: "Test") }

	it "category can be saved" do
    expect(category).to be_valid
  end

	it 'can create a new product', js: true do
	  visit root_path
	  click_link 'New Product'
	  p Category.all

	  fill_in 'product[name]', with: "My new product"
	  fill_in 'product[description]',with: "My new product description"
	  fill_in 'product[price]',with: "1000"
	  click_button 'Create Product'
	  expect(page).to have_content("My new product")
	end

end