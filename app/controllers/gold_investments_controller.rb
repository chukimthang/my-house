class GoldInvestmentsController < ApplicationController
  before_action :load_gold_investment, only: %i[edit update destroy]

  def index
    if params[:q].present?
      params[:q][:s] = 'transaction_date desc' if params[:q][:s].blank?
      params[:q].compact_blank!
    else
      params[:q] = { s: 'transaction_date desc' }
    end
    @q = GoldInvestment.ransack(params[:q])
    result = @q.result
    @total_buy_chi = result.buy.sum(:number_of_chi)
    @total_sell_chi = result.sell.sum(:number_of_chi)
    @total_buy_price = result.buy.sum('number_of_chi * unit_price')
    @total_sell_price = result.sell.sum('number_of_chi * unit_price')
    @gold_investments = result.page(params[:page]).per(10)
  end

  def new
    @gold_investment = GoldInvestment.new
  end

  def create
    @gold_investment = GoldInvestment.new(gold_investment_params)
    if @gold_investment.save
      flash[:success] = "Tạo thành công"
      redirect_to gold_investments_path
    else
      flash[:danger] = "Tạo thất bại"
      redirect_to new_gold_investment_path
    end
  end

  def edit; end

  def update
    if @gold_investment.update(gold_investment_params)
      flash[:success] = "Cập nhật thành công"
      redirect_to gold_investments_path
    else
      flash[:danger] = "Cập nhật thất bại"
      redirect_to edit_gold_investment_path(@gold_investment)
    end
  end

  def destroy
    if @gold_investment.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to gold_investments_path
  end

  private

  def gold_investment_params
    params.require(:gold_investment).permit(:number_of_chi, :unit_price, :transaction_type, :transaction_date, :description)
  end

  def load_gold_investment
    @gold_investment = GoldInvestment.find_by(id: params[:id])
    return if @gold_investment.present?

    flash[:danger] = "Không tìm thấy dữ liệu"
    redirect_to gold_investments_path
  end
end
