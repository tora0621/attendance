class WagesController < ApplicationController
  def index
    @wages = Wage.all
  end
  def show
  end
end
