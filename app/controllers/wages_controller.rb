class WagesController < ApplicationController
  def index
    @wages = Wage.all.includes(:worker)
  end
  def menu
  end
  def makanai
    @wages = Wage.all
    @wage = Wage.new
  end
  def eat
    if 
      @wage = Wage.where(shift_id: wage_params[:shift_id])
      @wage.update(meals: wage_params[:meals])
      redirect_to root_path
      flash[:finish] = '食べました'
    else
      flash.now[:alert] = '食べれませんでした'
      render 'makanai'
    end
  end

  def makanai_edit
    @wages = Wage.all.includes(:worker)
    @wage_name = Wage.select('worker_id')
    # binding.pry
  end
  def makanai_show
  end
  def makanai_delete
  end
  private
  def wage_params
    params.require(:wage).permit(
      # :worker_id,
      :shift_id,
      :meals
    )
  end
end

      