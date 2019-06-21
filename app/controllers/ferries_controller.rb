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
    @order = @bus.orders.pending.take
    @line = @order.lines.where(bus_id: @bus.id).take if @order.present?
    @delivery = Delivery.find(@line.delivery_id) if @order.present?
    @ferry.bus = @bus
    if @ferry.save
      redirect_to delivery_path(@delivery)
    else
      render :new
    end
  end

  def edit
    @ferry = Ferry.find(params[:id])
  end

  def update
    @ferry = Ferry.find(params[:id])
    @ferry.update(ferry_params)
    redirect_to ferry_path(@ferry[:id])
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
