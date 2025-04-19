class HomeController < ApplicationController
  def index
    bill_chart_service = Dashboard::BillChartService.new(params)
    bill_chart_service.execute
    @summary_bill = bill_chart_service.summary_bill
    @years = (2023..2030).map { |year| [year, year] }
  end

  def statistic_summary
    bill_chart_service = Dashboard::BillChartService.new(params)
    bill_chart_service.execute
    result = {
      summary_bill: bill_chart_service.summary_bill
    }

    respond_to do |format|
      format.json do
        render json: result
      end
    end
  end
end
