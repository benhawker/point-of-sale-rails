require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { FactoryGirl.create(:category) }

  describe "#show" do
    it "renders the show template" do
      get :show, {id: category.id}
      expect(response).to render_template(:show)
      expect(response.status).to eql(200)
    end

    it "shows the correct category" do
      get :show, {id: category.id}
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "#index" do
    it "assigns all categorys as @categorys" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end
end