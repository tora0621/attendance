class Shift < ApplicationRecord

  belongs_to :worker
  scope :started, -> { where(end_at: nil).order(:start_at) }

  def sum
    # if start_at.present? && end_at.present?
      end_at - start_at
    # end
  end

end
