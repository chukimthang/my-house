class SavingsAccountsController < ApplicationController
  before_action :load_savings_account, only: %i[edit update destroy]

  def index
    if params[:q].present?
      params[:q][:s] = 'savings_date desc' if params[:q][:s].blank?
      params[:q].compact_blank!
    else
      params[:q] = { s: 'savings_date desc' }
    end
    @q = SavingsAccount.ransack(params[:q])
    @savings_accounts = @q.result.page(params[:page]).per(10)
  end

  def new
    @savings_account = SavingsAccount.new
  end

  def create
    @savings_account = SavingsAccount.new(savings_account_params)
    if @savings_account.save
      flash[:success] = "Tạo thành công"
      redirect_to savings_accounts_path
    else
      flash[:danger] = "Tạo thất bại"
      redirect_to new_savings_account_path
    end
  end

  def edit; end

  def update
    if @savings_account.update(savings_account_params)
      flash[:success] = "Cập nhật thành công"
      redirect_to savings_accounts_path
    else
      flash[:danger] = "Cập nhật thất bại"
      redirect_to edit_savings_account_path(@savings_account)
    end
  end

  def destroy
    if @savings_account.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
    redirect_to savings_accounts_path
  end

  private

  def savings_account_params
    params.require(:savings_account).permit(:savings_date, :sacombank_amount, :tpbank_amount, :vietcombank_amount, :description)
  end

  def load_savings_account
    @savings_account = SavingsAccount.find_by(id: params[:id])
    return if @savings_account.present?

    flash[:danger] = "Không tìm thấy dữ liệu"
    redirect_to savings_accounts_path
  end
end
