class WagesController < ApplicationController
  def index
    @wages = Wage.all
  end
end
