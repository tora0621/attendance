class Shift < ApplicationRecord

  belongs_to :worker
  scope :started, -> { where(end_at: nil).order(:start_at) }
end
