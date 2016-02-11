require 'rails_helper'

feature "Categories" do

	it 'can create a new category', js: true do
	  visit root_path
	  click_link 'New Category'
	  fill_in 'category[name]',with: "My new category"
	  click_button 'Create Category'
	  expect(page).to have_content("My new category")
	end

end