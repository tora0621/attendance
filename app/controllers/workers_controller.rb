class WorkersController < ApplicationController
  before_action :set_worker, only:  [:edit, :update, :destroy]

  def index
    @workers = Worker.all.includes(:shifts, :wages)
    # @workers = Worker.page(params[:page]).per(2)
    # binding.pry
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
       redirect_to root_path
    else
       render 'new'
    end
  end

  def show
    @worker = Worker.find_by(id: params[:id])
    # binding.pry
  end

  def edit
  end

  def update
    if  @worker.update(worker_params)
      redirect_to root_path
      flash[:rest_start] = '編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @worker.destroy
    redirect_to root_path
    flash[:finish] = '削除しました'
  end

private
  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(
    :first_name,
    :last_name,
    :first_name_kana,
    :last_name_kana,
    :tel,
    :e_mail,
    :post_number,
    :address,
    :per_hour,
    :birthday,
    :classification,
    :authority,
    :hire_date,
    :departure_date
    )
  end    


end
