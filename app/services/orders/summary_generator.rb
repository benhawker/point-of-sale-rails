module Orders
  class SummaryGenerator
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def generate
      get_orders
    end

    private

    def get_orders
      Order.where("orders.created_at >= ? AND orders.created_at <= ?", start_date, end_date)
    end

    def build_summary
      summary_hash = {}

      get_orders.each do |order|
        summary_hash[:created_at] = order.created_at
        summary_hash[:customer_name] = order.customer.name
        summary_hash[:total] = order.total
        summary_hash[:status] = order.status
      end

      summary_hash
    end
  end
end
