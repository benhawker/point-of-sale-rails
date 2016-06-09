class OrdersController < ApplicationController
  respond_to :html, :js

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)
    @order.customer = Customer.find(params[:order][:customer])
    if @order.save
      @order.calculate_total
      respond_with(@order)
    else
      flash[:notices] = ['Order was not created. Please try again']
      render 'new'
    end
  end

  def show
    find_order
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      @order.calculate_total
    end
  end

  def edit
    find_order
  end

  def update
    find_order
    @order.customer = Customer.find(params[:order][:customer])
    if @order.update(order_params)
      @order.calculate_total
      flash[:notices] = ["Order was successfully updated"]
      render 'show'
    else
      flash[:notices] = ["Order could not be updated"]
      render 'edit'
    end
  end

  def destroy
    find_order
    @orders = Order.all

    respond_to do |format|
      if @order.destroy
        format.js
        format.html { redirect_to orders_path, notice: "Order was successfully deleted" }
      else
        format.js
        format.html { render order_path(@order), notice: "Order could not be deleted" }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, order_items_attributes:[:id, :product_id, :quantity])
  end

  def find_order
    @order = Order.find(params[:id])
  end


end