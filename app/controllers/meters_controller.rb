class MetersController < ApplicationController
  before_action :load_meter, only: %i[edit update destroy]

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
    if @meter.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to meters_path
  end

  private

  def meter_params
    params[:meter][:month_used] = "#{params[:meter][:month_used]}-01" if params[:meter][:month_used].present?
    params.require(:meter).permit(:month_used, :electricity_index, :water_index)
  end

  def load_meter
    @meter = Meter.find_by(id: params[:id])
    return if @meter.present?

    flash[:danger] = "Không tìm thấy dữ liệu"
    redirect_to meters_path
  end
end
