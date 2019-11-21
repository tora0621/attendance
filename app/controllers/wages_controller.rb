class WagesController < ApplicationController
  def index
    @wages = Wage.all.includes(:worker)
  end
  def show
  end
  def menu
  end
end
