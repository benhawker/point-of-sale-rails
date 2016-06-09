class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def show
    find_category
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

end