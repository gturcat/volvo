class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
  end

  def show
    session[:bus_id] = nil
    session[:trade_id] = nil
    session[:order_id] = nil
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    @order = @line.order
    session[:delivery_id] = @delivery.id
    @trade = @order.trades.last
    @traded_bus = @trade.bus if @trade.present?
    @documents_facturation = ["Facture"]
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to delivery_path(@delivery)
  end

  private

  def delivery_params
    params.require(:delivery).permit(
      :id,
      :lieu_prepa,
      :place_id,
      :date_livraison,
      :heure_livraison,
      :date_facturation,
      :montant,
      :entitee,
      :duree_buy_back,
      :pourcentage_buy_back
    )
  end
end
