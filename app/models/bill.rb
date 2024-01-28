class Bill < ApplicationRecord
  belongs_to :meter

  validates :meter_id, presence: true, uniqueness: true
end
