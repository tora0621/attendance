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
      working_seconds = end_at - start_at
    else
      working_seconds = end_at - start_at - ( rest_end_at - rest_start_at )
    end
    working_hours = working_seconds / 60 / 60
    night_border = DateTime.parse "10:00 pm"

    if working_hours > 8 && night_border < end_at
      base_wage = (8 * worker.per_hour).round
      long_time = working_hours - 8
      long_wage = (worker.per_hour * 1.25 * long_time).round
      night_time = (end_at - night_border) / 60 / 60
      night_wage = (working_hours * 1.5 * night_time)
    elsif night_border < end_at
      night_time = (end_at - night_border) / 60 / 60
      night_wage = (worker.per_hour * 1.25 * night_time).round
      base_time = (night_border - start_at) / 60 / 60
      base_wage = (worker.per_hour * base_time).round
    elsif working_hours > 8
      base_wage = (8 * worker.per_hour).round
      long_time = working_hours - 8
      long_wage = (worker.per_hour * 1.25 * long_time).round
    else 
      base_wage = (working_hours * worker.per_hour).round  ## 8 >= working_hours
    end

    total_wage = base_wage + long_wage + night_wage
    @shift = Shift.finish.last
    @wage = Wage.new
    @wage.attributes = {base: base_wage, long: long_wage, night: night_wage, total: total_wage, worker_id: @shift.worker_id, shift_id: @shift.id}
    @wage.save
  end
end
