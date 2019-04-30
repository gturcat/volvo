class TradesController < ApplicationController
  def new
    @q = Bus.ransack(params[:q])
    search_used_bus
    @order = Order.find(params[:order_id])
    @line = Line.find(params[:line_id])
    @trade = Trade.new
    @traded_bus = Bus.find(params[:format]) if params[:format].present?
  end

  def edit
  end

  def create
    @trade = Trade.new(trade_params)
    @bus = @trade.bus
    @bus.status1 = "stock VO"
    @bus.save
    if @trade.save
      redirect_to order_path(@trade.line.order)
     else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

  def search_used_bus
    @used_buses = @q.result.where(status1: "client")
  end

  def trade_params
    params.require(:trade).permit(
      :date_rentree_bdc,
      :prix_achat,
      :order_id,
      :line_id,
      :bus_id
    )
  end

end
