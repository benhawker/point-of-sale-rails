require 'rails_helper'

feature "Categories", js: true do

  let!(:category) { FactoryGirl.create(:category, name: "Test Category") }

  xit 'can view an existing category' do
    visit root_path
    puts Category.count
    click_link 'Categories'
    expect(current_path).to eq categories_path
    expect(page).to have_content("Test Category")
    click_link "Test Category"
    expect(current_path).to eq category_path(category)
  end
end