class WagesController < ApplicationController
  def index
    @wages = Wage.all
    # binding.pry
  end
  def show
  end
end
