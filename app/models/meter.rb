class Meter < ApplicationRecord
  has_one :bill, dependent: :destroy

  validates :month_used, :electricity_index, :water_index, presence: true
  validates :electricity_index, :water_index, numericality: { greater_than: 0 }

  def self.last_month(date)
    Meter.where("month_used < ?", date).order(month_used: :desc).first
  end
end
