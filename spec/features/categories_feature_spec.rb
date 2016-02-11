require 'rails_helper'

feature "Categories" do

	let(:category) { FactoryGirl.create(:category, name: "Test Category") }

	it 'can create a new category', js: true do
	  visit root_path
	  click_link 'New Category'
	  fill_in 'category[name]',with: "My new category"
	  click_button 'Create Category'
	  expect(page).to have_content("My new category")
	end

	it 'can view an existing category', js: true do
	  visit root_path
	  click_link 'Show Categories'
	  expect(page).to have_content("Test Category")
	  click_link "Test Category"
	  expect(current_path).to eq category_path(category)
	end

end