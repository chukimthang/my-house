class Bill < ApplicationRecord
  belongs_to :meter

  delegate :month_used, to: :meter, prefix: true, allow_nil: true

  validates :meter_id, presence: true, uniqueness: true
end
