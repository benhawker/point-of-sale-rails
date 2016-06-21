require 'rails_helper'

describe Orders::SummaryGenerator do

  let!(:valid_order) { FactoryGirl.create(:order) }
  let!(:invalid_order) { FactoryGirl.create(:order) }

  let(:start_date) { Date.new(2016,1,1) }
  let(:end_date) { Date.new(2016,1,30) }
  let!(:subject) { Orders::SummaryGenerator.new(start_date, end_date) }

  describe "generate" do
    it "generates a summary of orders between the selected dates" do
      expect(subject).to include (valid_order)
    end

    it "does not includes orders that were created outside of the specified dates" do
      expect(subject).to not_include (invalid_order)
    end
  end
end
