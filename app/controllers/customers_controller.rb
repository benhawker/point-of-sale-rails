class CustomersController < ApplicationController

	def index
		@customers = Customer.paginate(page: params[:page])
  end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			flash[:notices] = ['Customer created successfully']
      redirect_to customers_path
    else
      render 'new'
    end
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
      flash[:notices] = ["Customer was successfully updated"]
      render 'show'
    else
      flash[:notices] = ["Customer could not be updated"]
      render 'edit'
    end
  end

	def destroy
		@customer = Customer.find(params[:id])
		if @customer.destroy
      flash[:notices] = ["Customer was successfully deleted"]
      redirect_to customers_path
    else
      flash[:notices] = ["Customer could not be deleted"]
      render customer_path(@Customer)
    end
	end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end