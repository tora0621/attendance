class ShiftsController < ApplicationController
  # before_action :set_shift, only: [:show, :edit, :update, :destroy, :rest_time_start, :rest_time_end]
  # before_action :set_user, only: [:start, :finish, :rest_time_start, :rest_time_end]

  def index
    # binding.pry
    @users = User.all
    @shifts = Shift.all
  end
  def new
    @shift = Shift.new
    # binding.pry
  end
  def create
    @shift = Shift.new(shift_params)

    # binding.pry
    @shift.save
    # binding.pry
  end

  def start
    # binding.pry
    @shift = Shift.new(shift_params)
    # binding.pry
    @shift.save!
    redirect_to root_path
    flash[:attend] = '出勤しました' 
  end

  def finish
    @shift = Shift.new(shift_params)
    # binding.pry
    @shift.save!
    redirect_to root_path
    flash[:finish] = '退勤しました'
  end
  def rest_time_start
    @shift = Shift.new(shift_params)
    # binding.pry
    @shift.save!
    redirect_to root_path
    flash[:rest_start] = '休憩です'
  end
  def rest_time_end
    @shift = Shift.new(shift_params)
    # binding.pry
    @shift.save!
    redirect_to root_path
    flash[:rest_end] = '戻りです'
  end

  

  private 
  def shift_params
    params.require(:shift).permit(
      :user_id,
      :start_at,
      :end_at,
      :rest_start_at,
      :rest_end_at
    )
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id].to_i) if params[:user_id].present?
  end
end
