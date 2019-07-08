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
    @trade = Trade.find(params[:id])
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.status = true
    @bus = @trade.bus
    @bus.statut2 = "VO à rentrer"
    @bus.facture_livre!
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
    @trade = Trade.find(params[:id])
    @bus = @trade.bus
    @bus.statut2 = ""
    @bus.facture_livre!
    @bus.save
    @trade.delete
    redirect_to order_path(@trade.line.order)
  end

  def show

    session[:bus_id] = nil
    session[:order_id] = nil
    session[:delivery_id] = nil
    @trade = Trade.find(params[:id])
    @order = @trade.line.order
    @line =  @trade.line
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

  def archive
    @trades = Trade.all.where(status: false)
  end

  def close
    @trade = Trade.find(params[:id])
    @bus = @trade.bus
    @trade.status = false
    @bus.disponible!
    @bus.statut2 = "Stock VO"
    @bus.save
    @trade.save
    redirect_to trade_path(@trade)
  end

  private

  def search_used_bus
    @used_buses = @q.result.where(statut1: "facture_livre").where.not(statut2: "VO à rentrer")
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
    )
  end

end
