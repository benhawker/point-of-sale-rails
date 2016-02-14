class Admin::ProductsController < ApplicationController
  respond_to :html, :js

	def index
		@products = Product.paginate(page: params[:page])
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order('created_at DESC')
    end
  end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
    @product.category = Category.find(params[:product][:category])
		if @product.save
			flash[:notices] = ['Product created successfully']
      redirect_to admin_products_path
    else
      render 'new'
    end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
    @product.category = Category.find(params[:product][:category])
		if @product.update(product_params)
      flash[:notices] = ["Product was successfully updated"]
      render 'show'
    else
      flash[:notices] = ["Product could not be updated"]
      render 'edit'
    end
  end

	def destroy
		@product = Product.find(params[:id])
		if @product.destroy
      flash[:notices] = ["Product was successfully deleted"]
      redirect_to admin_products_path
    else
      flash[:notices] = ["Product could not be deleted"]
      render admin_product_path(@product)
    end
	end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end

