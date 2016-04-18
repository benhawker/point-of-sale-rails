require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:customer) { FactoryGirl.create(:customer) }
  let(:order) { FactoryGirl.create(:order, customer: customer) }

  describe "#show" do
    it "renders the show template" do
      get :show, {id: order.id}
      expect(response).to render_template(:show)
      expect(response.status).to eql(200)
    end

    it "shows the correct order" do
      get :show, {id: order.id}
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "#index" do
    it "assigns all orders as @orders" do
      get :index
      expect(assigns(:orders)).to eq([order])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eql(200)
    end
  end

  describe "#new" do
    it "assigns a new order as @order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
      expect(response.status).to eql(200)
    end
  end

  describe "#edit" do
    it "assigns the requested order as @order" do
      get :edit, {:id => order.to_param}
      expect(assigns(:order)).to eq(order)
    end
  end

end
