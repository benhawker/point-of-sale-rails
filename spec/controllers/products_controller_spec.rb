require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  let(:product) { FactoryGirl.create(:product) }

  describe "#show" do
    it "renders the show template" do
      get :show, {id: product.id}
      expect(response).to render_template(:show)
      expect(response.status).to eql(200)
    end

    it "shows the correct product" do
      get :show, {id: product.id}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "#index" do
    it "assigns all products as @products" do
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eql(200)
    end
  end

  describe "#edit" do
    it "assigns the requested product as @product" do
      get :edit, {:id => product.to_param}
      expect(assigns(:product)).to eq(product)
    end
  end
end