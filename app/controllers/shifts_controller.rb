class ShiftsController < ApplicationController
  # before_action :set_shift, only: [:show, :edit, :update, :destroy, :rest_time_start, :rest_time_end]
  before_action :set_worker, only: [:start, :finish, :rest_time_start, :rest_time_end]
  

  def index
    @shifts = Shift.all
  end
  def new
    @shift = Shift.new
  end
  def create
    @shift = Shift.new(shift_params)
    @shift.save
  end

  def start
    @shift = Shift.new(shift_params)
    if @shift.save
      id = @shift.worker_id
      # binding.pry
      @worker = Worker.find(id).update_attributes(status: :attendance)
      redirect_to root_path
      flash[:attend] = '出勤しました' 
    else
      render 'new'
    end
  end

  def finish
    @shift = Shift.where(params[:worker_id]).started.last
    @shift.end_at = Time.now
    if @shift.action_required = true
      @shift.save
      id = @shift.worker_id
      @worker = Worker.find(id).update_attributes(status: :un_attendance)
      redirect_to root_path
      flash[:finish] = '退勤しました'
    else
      render 'new'
    end
  end

  def rest_time_start
    @shift = Shift.where(params[:worker_id]).started.last
    @shift.rest_start_at = Time.now
    if @shift.save
      id = @shift.worker_id
      @worker = Worker.find(id).update_attributes(status: :rest)
      redirect_to root_path
      flash[:rest_start] = '休憩です'
    else 
      render 'new'
    end
  end

  def rest_time_end
    @shift = Shift.where(params[:worker_id]).started.last
    @shift.rest_end_at = Time.now
    if @shift.save
      id = @shift.worker_id
      @worker = Worker.find(id).update_attributes(status: :attendance)
      redirect_to root_path
      flash[:rest_end] = '戻りです'
    else
      render 'new'
    end
  end

  

  private 
  def shift_params
    params.require(:shift).permit(
      :worker_id,
      :start_at,
      :end_at,
      :rest_start_at,
      :rest_end_at
    )
  end

  # def set_shift
  #   @shift = Shift.find(params[:id])
  # end

  def set_worker
    @worker = Worker.find(params[:worker_id].to_i) if params[:worker_id].present?
  end
end
