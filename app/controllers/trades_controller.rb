class TradesController < ApplicationController
  def new
    @ordered_bus = Bus.find(params[:bus_id])
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
    @trade.status = true
    @bus = @trade.bus
    @bus.status2 = "VO à rentrer"
    @bus.status1 = "Client"
    @bus.save
    if @trade.save
      redirect_to order_path(@trade.line.order)
     else
      render :new
    end
  end

  def update
    @trade = Trade.find(params[:id])
    @trade = Trade.update(trade_params)
    redirect_to trade_path(@trade)
  end

  def destroy
  end

  def show
    session[:bus_id] = nil
    @trade = Trade.find(params[:id])
    @client_name = @trade.line.order.client
    session[:trade_id] = @trade.id
    @bus = @trade.bus
    @documents_for_trade = ["fiche R.C.R",
                            "CERFA Cession",
                            "DA ",
                            "C.I original barrée",
                            "Controle Technique",
                            "Cerfificat de non gage",
                            "C.O.C",
                            "Attestation Amenagemenet"]
  end

  def index
    @trades = Trade.all.where(status: true)
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
      :bus_id,
      :date_rentree,
      :heure_rentree,
      :status
    )
  end

end
