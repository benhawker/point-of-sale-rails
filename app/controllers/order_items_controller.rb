class OrderItemsController < ApplicationController

	before_action :get_order

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = @order.order_items.new(order_items_params)
    if @order_item.save(order_items_params)
      @order.calculate_total
    	flash[:notices] = ["New order item successfully created"]
      redirect_to order_path(@order)
    else
			render 'new'
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    respond_to do |format|
      if @order_item.update(order_items_params)
        format.html do
          @order.calculate_total
          flash[:notices] = ["Order item successfully updated"]
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
    @order_item = @order.order_items.find(params[:id])
    respond_to do |format|
      if @order_item.destroy
        format.html do
          @order.calculate_total
          flash[:notices] = ["Order item successfully removed"]
          redirect_to order_path(@order)
        end
        format.js
        @order.calculate_total

      else format.html
        render 'new'
      end
    end
  end

  # def destroy
  #   @order_item = @order.order_items.find(params[:id])
    
  #   respond_to do |format|
  #   if @order_item.destroy
  #     format.html do
  #       @order.calculate_total
  #       flash[:notices] = ['Order Item was successfully removed']
  #       redirect_to order_path(@order)
  #     end
  #     format.js
  #     @order.calculate_total

  #   else
  #     flash[:alerts] = ['No way! Order Item was not removed.']
  #     redirect_to order_path(@order)
  #   end
  # end

  private

  def order_items_params
  	params.require(:order_item).permit(:product_id, :quantity)
  end

  def get_order
		@order = Order.find(params[:order_id])
  end

end