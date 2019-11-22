class WagesController < ApplicationController
  def index
    @wages = Wage.all.includes(:worker)
  end
  def menu
  end
  def makanai
    @wage = Wage.new
  end
  def eat
    @wage = Wage.new(wage_params)
    # binding.pry
    @wage.save
    render 'makanai'
  end
  private
  def wage_params
    # binding.pry
    params.require(:wage).permit(
      :worker_id,
      :meals
    )
  end
end
