require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
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
      expect(response.status).to eql(200)
    end
  end

  describe "#new" do
    it "assigns a new category as @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
      expect(response.status).to eql(200)
    end
  end

  describe "#edit" do
    it "assigns the requested category as @category" do
      get :edit, {:id => category.to_param}
      expect(assigns(:category)).to eq(category)
    end
  end


end