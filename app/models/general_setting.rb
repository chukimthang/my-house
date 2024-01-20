class GeneralSetting < ApplicationRecord
  validates :rent, :electricity_price, :water_price, :surcharge, presence: true
  validates :rent, :electricity_price, :water_price, :surcharge, numericality: { greater_than_or_equal_to: 0 }
end
