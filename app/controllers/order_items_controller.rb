class OrderItemsController < ApplicationController

  before_action :get_order

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = @order.order_items.new(order_items_params)
    if @order_item.save(order_items_params)
      @order.calculate_total
      flash[:notices] = ["New Item Added"]
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    find_order_item
    respond_to do |format|
      if @order_item.update(order_items_params)
        format.html do
          @order.calculate_total
          flash[:notices] = ["Item Updated"]
          redirect_to order_path(@order)
        end
        format.js
        @order.calculate_total

      else format.html
        render 'new'
      end
    end
  end

  def destroy
    find_order_item
    respond_to do |format|
      if @order_item.destroy
        format.html do
          @order.calculate_total
          flash[:notices] = ["Item Removed"]
          redirect_to order_path(@order)
        end
        format.js
        @order.calculate_total

      else format.html
        render 'new'
      end
    end
  end

  private

  def order_items_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def get_order
    @order = Order.find(params[:order_id])
  end

  def find_order_item
    @order_item = @order.order_items.find(params[:id])
  end

end