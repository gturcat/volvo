class FerriesController < ApplicationController
  def index
    @ferries = Ferry.all
  end

  def show
    @ferry = Ferry.find(params[:id])
  end
end
