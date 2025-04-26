class SavingsAccount < ApplicationRecord
  validates :savings_date, :sacombank_amount, :tpbank_amount, :vietcombank_amount, presence: true
end
