class Dashboard::BillChartService
  attr_reader :summary_bill

  def initialize(params = {})
    @year = params[:year].present? ? params[:year].to_i : Date.current.year
    @summary_bill = {}
  end

  def execute
    %i[rent surcharge_fee water_cost electricity_cost].each do |cost_type|
      fill_data(cost_type)
    end
  end

  private

  def fill_data(cost_type)
    cost_of_month = []
    (1..12).each do |month|
      bill_of_month = bills.select { |bill| bill.meter.month_used.month == month }.first
      cost_of_month << (bill_of_month.present? ? bill_of_month.send(cost_type) : 0)
    end
    @summary_bill[label_mappings[cost_type]] = cost_of_month
  end

  def bills
    @bills ||= Bill.eager_load(:meter).where("EXTRACT(YEAR FROM meters.month_used) = ?", @year)
  end

  def label_mappings
    {
      rent: 'Tiền thuê nhà',
      surcharge_fee: 'Phụ phí',
      water_cost: 'Tiền nước',
      electricity_cost: 'Tiền điện'
    }
  end
end
