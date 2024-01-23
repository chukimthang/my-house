class GeneralSettingController < ApplicationController
  before_action :load_general_setting, only: [:edit, :update]

  def edit; end

  def update
    if @general_setting.update(general_setting_params)
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to general_setting_path
  end

  private

  def load_general_setting
    @general_setting = GeneralSetting.first
  end

  def general_setting_params
    params.require(:general_setting).permit(:room_name, :rent, :electricity_price, :water_price, :surcharge, :description)
  end
end
