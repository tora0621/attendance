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
    @wage = Worker.new(wage_params)
  end

end
