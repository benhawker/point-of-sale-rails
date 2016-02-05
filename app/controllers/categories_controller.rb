class CategoriesController < ApplicationController

	def index
		@categories = Category.paginate(page: params[:page])
  end

	def new
		@Category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notices] = ['Category created successfully']
      redirect_to categories_path
    else
      render 'new'
    end
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
      flash[:notices] = ["Category was successfully updated"]
      render 'show'
    else
      flash[:notices] = ["Category could not be updated"]
      render 'edit'
    end
  end

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
      flash[:notices] = ["Category was successfully deleted"]
      redirect_to categories_path
    else
      flash[:notices] = ["Category could not be deleted"]
      render category_path(@category)
    end
	end

  private

  def category_params
    params.require(:Category).permit()
  end

end