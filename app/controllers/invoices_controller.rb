class InvoicesController < ApplicationController

  def create
    @order = Order.find(params[:order_id])
    @invoice = InvoicePresenter.new(@order)
  end

end