class Meter < ApplicationRecord
  validates :month_used, :electricity_index, :water_index, presence: true
  validates :electricity_index, :water_index, numericality: { greater_than: 0 }
end
