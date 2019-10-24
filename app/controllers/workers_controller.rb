class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end
  def create
    @worker = Worker.new(worker_params)
    @worker.save
    redirect_to root_path
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
    :birthday,
    :classification,
    :authority,
    :hire_date,
    :departure_date
    )
  end    


end
