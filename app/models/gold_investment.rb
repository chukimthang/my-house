class GoldInvestment < ApplicationRecord
  TRANSACTION_TYPE = {
    buy: 'Mua vào',
    sell: 'Bán ra'
  }.freeze

  enum transaction_type: { buy: 0, sell: 1 }

  validates :number_of_chi, :unit_price, :transaction_date, presence: true
  validates :number_of_chi, :unit_price, numericality: { greater_than: 0 }
end
