class ShiftsController < ApplicationController

  def index
    @shift = Shift.new
  end
end
