class BillsController < ApplicationController
  before_action :load_bill, only: [:show, :destroy]
  before_action :load_general_setting, only: [:new, :show]

  def index
    @bills = Bill.includes(:meter).order('meters.month_used DESC')
  end

  def new
    @bill = Bill.new
    meters = Meter.order(month_used: :desc).select(:month_used, :id)
    @months = meters.map {|meter| [meter.month_used.strftime('%B %Y'), meter.id]}
    @number_of_members = (1..5).to_a
  end

  def create
    create_bill_service = CreateBillService.new(bill_params[:meter_id])
    create_bill_service.execute
    if create_bill_service.is_success
      flash[:success] = "Thêm mới thành công"
      redirect_to bills_path
    else
      flash[:danger] = "Thêm mới thất bại"
      redirect_to new_bill_path
    end
  end

  def show
    @meter = @bill.meter
    @last_meter = Meter.last_month(@meter.month_used)
  end

  def destroy
    if @bill.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to bills_path
  end

  private

  def bill_params
    params.require(:bill).permit(:meter_id)
  end

  def load_bill
    @bill = Bill.find_by(id: params[:id])
    return if @bill.present?

    flash[:danger] = "Không tìm thấy dữ liệu"
    redirect_to bills_path
  end

  def load_general_setting
    @general_setting = GeneralSetting.first
  end
end
