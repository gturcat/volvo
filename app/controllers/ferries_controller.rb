class FerriesController < ApplicationController
  def index
    @ferries = Ferry.all
  end


  def new
  @ferry = Ferry.new
  @bus = Bus.find(params[:bus_id])
  end

  def create
    @ferry = Ferry.new(ferry_params)
    @bus = Bus.find(params[:bus_id])
    @ferry.bus = @bus
    if @ferry.save
      redirect_to bus_path(@ferry.bus[:id])
    else
      render :new
    end
  end

  def show
    @ferry = Ferry.find(params[:id])
  end

  private

  def ferry_params
    params.require(:ferry).permit(:depart, :arrivee, :date_convoyage, :site, :note, :numero_bdc)
  end

end
