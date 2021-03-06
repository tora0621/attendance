class Wage < ApplicationRecord
  belongs_to :shift
  belongs_to :worker

  scope :totals, -> { Wage.all.sum(:total) }
  scope :wage_all, -> { where.not(total: 0)}
  scope :started, -> { where(end_at: nil).order(:start_at) }
end
