class Admin::ProductsController < ApplicationController
  layout 'admin'
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
      flash[:notices] = ['Product Created']
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def show
    find_product
  end

  def edit
    find_product
  end

  def update
    find_product
    @product.category = Category.find(params[:product][:category])
    if @product.update(product_params)
      flash[:notices] = ["Product Updated"]
      render 'show'
    else
      flash[:notices] = ["Product could not be updated - please try again."]
      render 'edit'
    end
  end

  def destroy
    find_product
    if @product.destroy
      flash[:notices] = ["Product Deleted"]
      redirect_to admin_products_path
    else
      flash[:notices] = ["Product could not be deleted - please try again."]
      render admin_product_path(@product)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
