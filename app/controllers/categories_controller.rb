class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def show
    @category = Category.find(params[:id])
  end

end