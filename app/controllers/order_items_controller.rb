class OrderItemsController < ApplicationController

	before_action :get_order

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = @order.order_items.find(params[:id])
    if @order_item.save(order_items_params)
    	flash[:notices] = ["New order item successfully created"]
      redirect_to order_path(@order)
    else
			render 'new'
    end
  end

  def update
    @order_item = @order.line_items.find(params[:id])
    if @line_item.update(order_items_params)
    	flash[:notices] = ["Order item successfully updated"]
      redirect_to order_path(@order)
    else
			render 'new'
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
      flash[:notices] = ['Order Item was successfully removed']
      redirect_to order_path(@order)
    else
      flash[:alerts] = ['No way! Order Item was not removed.']
      redirect_to order_path(@order)
    end
  end

  private

  def order_item_params
  	params.require(:order_item).permit(:quantity)
  end

  def get_order
		@order = Order.find(params[:order_id])
  end

end