class CreateBillService
  attr_accessor :is_success

  def initialize(meter_id)
    @meter_id = meter_id
    @general_setting = GeneralSetting.first
  end

  def execute
    bill = Bill.new
    bill.meter_id = @meter_id
    bill.electricity_quantity = electricity_quantity
    bill.water_quantity = water_quantity
    bill.electricity_cost = electricity_cost
    bill.water_cost = water_cost
    bill.surcharge_fee = surcharge_fee
    bill.total_amount = general_setting.rent + electricity_cost + water_cost + surcharge_fee
    @is_success = bill.save
  end

  private

  def general_setting
    @general_setting ||= GeneralSetting.first
  end

  def meter
    @meter ||= Meter.find(@meter_id)
  end

  def last_meter
    @last_meter ||= Meter.last_month(meter.month_used)
  end

  def electricity_quantity
    @electricity_quantity ||= meter.electricity_index - last_meter&.electricity_index.to_i
  end

  def water_quantity
    @water_quantity ||= meter.water_index - last_meter&.water_index.to_i
  end

  def electricity_cost
    @electricity_cost ||= electricity_quantity * general_setting.electricity_price
  end

  def water_cost
    @water_cost ||= water_quantity * general_setting.water_price
  end

  def surcharge_fee
    @surcharge_fee ||= general_setting.surcharge * meter.amount_of_members
  end
end
