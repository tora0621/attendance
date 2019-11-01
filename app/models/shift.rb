class Shift < ApplicationRecord

  belongs_to :worker
  has_one :wage

  scope :started, -> { where(end_at: nil).order(:start_at) }
  scope :finish, -> { where.not(start_at: nil, end_at: nil) }

  attr_accessor :action_required
  after_save :salary, if: :action_required?

  def day_salary
    if rest_end_at.nil? and rest_start_at.nil?
      s = end_at - start_at
    else
      s = end_at - start_at - ( rest_end_at - rest_start_at )
    end
      h = s / 60 / 60
      # binding.pry
      @wage = (h * worker.per_hour).round
  end

  def action_required?
    action_required
  end

  private
  def salary
    if rest_end_at.nil? and rest_start_at.nil?
      s = end_at - start_at
    else
      s = end_at - start_at - ( rest_end_at - rest_start_at )
    end
      h = s / 60 / 60
      m = (h * worker.per_hour).round
      @shift = Shift.finish.last
      @wage = Wage.new
      @wage.attributes = {base: m,worker_id: @shift.worker_id, shift_id: @shift.id}
      # binding.pry
      @wage.save
  end
  # def total_salary
  #     @shifts = Shift.all
  #     array = []
  #     @shifts.finish.each do |shift|
  #       array << shift.day_salary
  #     end
  #     array.sum
  # end
end
