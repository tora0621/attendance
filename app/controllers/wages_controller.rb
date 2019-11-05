class WagesController < ApplicationController
  def index
    @wages = Wage.all.includes(:worker)
    # binding.pry
    # d = Wage.all.sum(:total)
    # binding.pry
  end
  def show
  end
end
