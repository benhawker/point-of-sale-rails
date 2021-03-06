class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page])
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order('created_at DESC')
    end
  end

  def show
    find_product
  end

  def edit
    find_product
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
