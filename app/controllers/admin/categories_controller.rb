class Admin::CategoriesController < ApplicationController
  layout 'admin'
  respond_to :html
  respond_to :js

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notices] = ['Category Created']
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def show
    find_category
  end

  def edit
    find_category
  end

  def update
    find_category
    if @category.update(category_params)
      flash[:notices] = ["Category Updated"]
      render 'show'
    else
      flash[:notices] = ["Category could not be updated - please try again."]
      render 'edit'
    end
  end

  def destroy
    find_category
    if @category.destroy
      flash[:notices] = ["Category Deleted"]
      redirect_to admin_categories_path
    else
      flash[:notices] = ["Category could not be deleted - please try again."]
      render admin_category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end