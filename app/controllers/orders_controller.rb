class OrdersController < ApplicationController

	def index
		@orders = Order.paginate(page: params[:page])
    if params[:search]
      @orders = Order.search(params[:search]).order("created_at DESC")
    else
      @orders = Order.all.order('created_at DESC')
    end
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
      flash[:notices] = ['Order created successfully']
      redirect_to orders_path
    else
      flash[:notices] = ['Order was not created. Please try again']
      render 'new'
    end
  end

	def show
		@order = Order.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      @order.calculate_total
    end
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
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
		@order = Order.find(params[:id])
		if @order.destroy
      flash[:notices] = ["Order was successfully deleted"]
      redirect_to orders_path
    else
      flash[:notices] = ["Order could not be deleted"]
      render Order_path(@order)
    end
	end

  private

  def order_params
    params.require(:order).permit(:customer_name, order_items_attributes:[:id, :product_id, :quantity])
  end


end