class ShiftsController < ApplicationController

  def index
    @shift = Shift.new
    # binding.pry
  end
  def create
    @shift = Shift.new(shift_params)
    # binding.pry
    @shift.save
    # binding.pry
  end

  private 
  def shift_params
    params.require(:shift).permit(
      :user_id,
      :starts_at
    )
  end
end
