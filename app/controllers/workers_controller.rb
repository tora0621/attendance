class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end
end
