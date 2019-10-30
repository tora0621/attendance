class Shift < ApplicationRecord

  belongs_to :worker
  scope :started, -> { where(end_at: nil).order(:start_at) }
  scope :finish, -> { where.not(start_at: nil, end_at: nil) }

  def day_salary
    if rest_end_at.nil? and rest_start_at.nil?
      s = end_at - start_at
    else
      s = end_at - start_at - ( rest_end_at - rest_start_at )
    end
      h = s / 60 / 60
      # binding.pry
      (h * worker.per_hour).round
  end
  def total_salary
      @shifts = Shift.all
      array = []
      @shifts.finish.each do |shift|
        array << shift.day_salary
      end
      array.sum
  end
      # total_salary = 0
      # @shifts = Shift.all
      # @shifts.finish.each do |shift|
      #   total_salary += shift.day_salary
      # end


      # sum = 0
      # @workers.each do |worker|
      #   worker.shifts.finish.each do |shift|
      #     sum += shift.salary
      #   end
      # end
end
