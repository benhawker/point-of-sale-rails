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
      flash[:notices] = ['Customer Created']
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def show
    find_customer
  end

  def edit
    find_customer
  end

  def update
    find_customer
    if @customer.update(customer_params)
      flash[:notices] = ["Customer Updated"]
      render 'show'
    else
      flash[:notices] = ["Customer could not be updated - please try again."]
      render 'edit'
    end
  end

  def destroy
    find_customer
    if @customer.destroy
      flash[:notices] = ["Customer Deleted"]
      redirect_to customers_path
    else
      flash[:notices] = ["Customer could not be deleted - please try again."]
      render customer_path(@Customer)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end