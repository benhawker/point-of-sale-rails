module Orders
  class SummaryGenerator

    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def generate!

    end

    private

    def get_orders
      Order.where("orders.created_at >= ? AND orders.created_at <= ?", start_date, end_date)
    end
  end
end