class ShiftsController < ApplicationController
  before_action :set_worker, only: [:start, :finish, :rest_time_start, :rest_time_end]
  
  def index
    @q = Shift.ransack(params[:q])
    @shifts = @q.result(distinct: true).all.includes(:worker)
    @dates = Date.today.all_month
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
      @worker = Worker.find(id).update_attributes(status: :attendance)
      redirect_to root_path
      flash[:attend] = '出勤しました' 
    else
      flash.now[:alert] = '出勤に失敗しました'
      render 'new'
    end
  end

  def finish
    @shift = Shift.where(params[:worker_id]).started.last
    @shift.end_at = Time.now
    if @shift.action_required = true
      @shift.save!
      id = @shift.worker_id
      @worker = Worker.find(id).update_attributes(status: :un_attendance)
      redirect_to root_path
      # binding.pry
      flash[:finish] = '退勤しました'
    else
      flash.now[:alert] = '退勤に失敗しました'
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
      flash.now[:alert] = '休憩に失敗しました'
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
      flash.now[:alert] = '戻りに失敗しました'
      render 'new'
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if 
      @shift.action_required = true
      @shift.update(shift_params)
      redirect_to shifts_path
      flash[:rest_start] = '勤務時間編集しました'
    else
      render 'edit'
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

  def set_worker
    @worker = Worker.find(params[:worker_id].to_i) if params[:worker_id].present?
  end
end
