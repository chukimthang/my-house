class MetersController < ApplicationController
  before_action :load_meter, only: %i[edit update destroy month_information]

  def index
    @meters = Meter.order(month_used: :desc)
  end

  def new
    @meter = Meter.new
  end

  def create
    @meter = Meter.new(meter_params)
    if @meter.save
      flash[:success] = "Tạo thành công"
      redirect_to meters_path
    else
      flash[:danger] = "Tạo thất bại"
      redirect_to new_meter_path
    end
  end

  def edit; end

  def update
    if @meter.update(meter_params)
      flash[:success] = "Cập nhật thành công"
      redirect_to meters_path
    else
      flash[:danger] = "Cập nhật thất bại"
      redirect_to edit_meter_path(@meter)
    end
  end

  def destroy
    if Bill.exists?(meter_id: @meter.id)
      flash[:danger] = "Không thể xóa dữ liệu đã xuất hoá đơn"
      return redirect_to meters_path
    end

    if @meter.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to meters_path
  end

  def month_information
    last_month = Meter.last_month(@meter.month_used)
    data = {
      last_electricity_index: last_month&.electricity_index.to_i,
      last_water_index: last_month&.water_index.to_i,
      this_electricity_index: @meter.electricity_index,
      this_water_index: @meter.water_index,
      amount_of_members: @meter.amount_of_members
    }
    render json: data
  end

  private

  def meter_params
    params[:meter][:month_used] = "#{params[:meter][:month_used]}-01" if params[:meter][:month_used].present?
    params.require(:meter).permit(:month_used, :electricity_index, :water_index, :amount_of_members)
  end

  def load_meter
    @meter = Meter.find_by(id: params[:id])
    return if @meter.present?

    flash[:danger] = "Không tìm thấy dữ liệu"
    redirect_to meters_path
  end
end
