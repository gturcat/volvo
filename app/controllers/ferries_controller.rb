class FerriesController < ApplicationController
  def index
    @ferries = Ferry.all
  end

  # def new
  #   @ferry = Ferry.new
  #   @bus = Bus.find(params[:bus_id])
  # end

  def create
    @ferry = Ferry.new(ferry_params)
    @bus = Bus.find(params[:bus_id])
    @order = @bus.orders.pending.take
    @line = @order.lines.where(bus_id: @bus.id).take if @order.present?
    # @delivery = Delivery.find(@line.delivery_id) if @order.present?
    @ferry.bus = @bus
    if @ferry.save
      respond_to do |format|
        format.html { redirect_to bus_path(@bus) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'buses/show' }
        format.js
      end
    end
  end

  def edit
    @ferry = Ferry.find(params[:id])
  end

  def update
    @ferry = Ferry.find(params[:id])
    @bus = Bus.find(params[:bus_id])
    @ferry.update(ferry_params)
    # @delivery = Delivery.find(session[:delivery_id])
    redirect_to bus_path(@delivery)
  end

  def destroy
    @ferry = Ferry.find(params[:id])
    @ferry.delete
    redirect_to ferries_path
  end

  def show
    @ferry = Ferry.find(params[:id])
  end

  private

  def ferry_params
    params.require(:ferry).permit(
      :depart,
      :arrivee,
      :date_convoyage,
      :site,
      :note,
      :numero_bdc,
      :sens
    )
  end
end
