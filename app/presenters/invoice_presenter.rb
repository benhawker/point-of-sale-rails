class InvoicePresenter

  def initialize(order)
    @order = order
    @customer = order.customer
  end

end